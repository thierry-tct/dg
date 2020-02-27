#include "catch.hpp"

#include "dg/llvm/analysis/PointsTo/PointerAnalysis.h"
#include "dg/analysis/PointsTo/PointerAnalysisFI.h"

#include "../include/dg/llvm/analysis/ThreadRegions/ControlFlowGraph.h"
#include "../include/dg/llvm/analysis/ThreadRegions/ThreadRegion.h"
#include "../lib/llvm/analysis/ThreadRegions/include/Graphs/GraphBuilder.h"

#include "../lib/llvm/analysis/ThreadRegions/include/Nodes/Nodes.h"

// ignore unused parameters in LLVM libraries
#if (__clang__)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-parameter"
#else
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-parameter"
#endif

#include <llvm/IR/Module.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Instructions.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/Support/raw_os_ostream.h>
#include <llvm/IRReader/IRReader.h>

#if (__clang__)
#pragma clang diagnostic pop // ignore -Wunused-parameter
#else
#pragma GCC diagnostic pop
#endif

#include <queue>
#include <string>

TEST_CASE("Test of node class methods", "[node]") {
    Node * node0 = createNode<NodeType::GENERAL>();
    Node * node1 = createNode<NodeType::CALL>();

    REQUIRE(node0->isArtificial());
    REQUIRE(node0->getType() == NodeType::GENERAL);



    SECTION("Incrementing Ids") {
        REQUIRE(node0->id() < node1->id());
    }

    SECTION("createNode creates the rightNode") {
        auto General = createNode<NodeType::GENERAL>();
        auto Fork = createNode<NodeType::FORK>();
        auto Join = createNode<NodeType::JOIN>();
        auto Lock = createNode<NodeType::LOCK>();
        auto Unlock = createNode<NodeType::UNLOCK>();
        auto Entry = createNode<NodeType::ENTRY>();
        auto Exit = createNode<NodeType::EXIT>();
        auto Call = createNode<NodeType::CALL>();
        auto CallReturn = createNode<NodeType::CALL_RETURN>();
        auto CallFuncPtr = createNode<NodeType::CALL_FUNCPTR>(nullptr);
        auto Return = createNode<NodeType::RETURN>();

        REQUIRE(General->getType() == NodeType::GENERAL);
        REQUIRE(Fork->getType() == NodeType::FORK);
        REQUIRE(Join->getType() == NodeType::JOIN);
        REQUIRE(Lock->getType() == NodeType::LOCK);
        REQUIRE(Unlock->getType() == NodeType::UNLOCK);
        REQUIRE(Entry->getType() == NodeType::ENTRY);
        REQUIRE(Exit->getType() == NodeType::EXIT);
        REQUIRE(Call->getType() == NodeType::CALL);
        REQUIRE(CallReturn->getType() == NodeType::CALL_RETURN);
        REQUIRE(CallFuncPtr->getType() == NodeType::CALL_FUNCPTR);
        REQUIRE(Return->getType() == NodeType::RETURN);
    }

    SECTION("nodeTypeToString works correctly") {
        std::string General = "NodeType::GENERAL";
        std::string Fork = "NodeType::FORK";
        std::string Join = "NodeType::JOIN";
        std::string Lock = "NodeType::LOCK";
        std::string Unlock = "NodeType::UNLOCK";
        std::string Entry = "NodeType::ENTRY";
        std::string Exit = "NodeType::EXIT";
        std::string Call = "NodeType::CALL";
        std::string CallReturn = "NodeType::CALL_RETURN";
        std::string CallFuncPtr = "NodeType::CALL_FUNCPTR";
        std::string Return = "NodeType::RETURN";

        REQUIRE(nodeTypeToString(NodeType::GENERAL) == General);
        REQUIRE(nodeTypeToString(NodeType::FORK) == Fork);
        REQUIRE(nodeTypeToString(NodeType::JOIN) == Join);
        REQUIRE(nodeTypeToString(NodeType::LOCK) == Lock);
        REQUIRE(nodeTypeToString(NodeType::UNLOCK) == Unlock);
        REQUIRE(nodeTypeToString(NodeType::ENTRY) == Entry);
        REQUIRE(nodeTypeToString(NodeType::EXIT) == Exit);
        REQUIRE(nodeTypeToString(NodeType::CALL) == Call);
        REQUIRE(nodeTypeToString(NodeType::CALL_RETURN) == CallReturn);
        REQUIRE(nodeTypeToString(NodeType::CALL_FUNCPTR) == CallFuncPtr);
        REQUIRE(nodeTypeToString(NodeType::RETURN) == Return);
    }

    SECTION("Node can correctly output its type in dot format") {
        auto nodeString = node1->dump();
        auto pos = nodeString.find(nodeTypeToString(NodeType::CALL));
        REQUIRE(pos != std::string::npos);
    }

    SECTION("add new successor increases size of successors"
            " of node0 and size of predecessors of node 1") {
        REQUIRE(node0->addSuccessor(node1));
        REQUIRE(node0->successors().size() == 1);
        REQUIRE(node1->predecessors().size() == 1);

        SECTION("adding the same successor for the second time does nothing") {
            REQUIRE_FALSE(node0->addSuccessor(node1));
            REQUIRE(node0->successors().size() == 1);
            REQUIRE(node1->predecessors().size() == 1);
        }
    }


    SECTION("Removing node1 from successors of node0"
            " decreases size of successors of node0 and predecessors of node1") {
        REQUIRE(node0->successors().empty());
        REQUIRE(node0->addSuccessor(node1));
        auto foundNodeIterator = node0->successors().find(node1);
        REQUIRE_FALSE(foundNodeIterator == node0->successors().end());
        REQUIRE(node0->successors().size() == 1);
        REQUIRE(node0->removeSuccessor(node1));
        REQUIRE(node0->successors().empty());
    }

    SECTION("Removing nonexistent successor does nothing") {
        REQUIRE(node0->successors().empty());
        REQUIRE_FALSE(node0->removeSuccessor(node1));
        REQUIRE(node0->successors().empty());
        Node * node2 = createNode<NodeType::GENERAL>();
        REQUIRE(node0->addSuccessor(node1));
        REQUIRE(node0->successors().size() == 1);
        REQUIRE_FALSE(node0->removeSuccessor(node2));
        REQUIRE(node0->successors().size() == 1);
    }

    SECTION("add new predecessor increases size of predecessors"
            " of node0 and size of successors of node 1") {
        REQUIRE(node0->predecessors().empty());
        REQUIRE(node0->addPredecessor(node1));
        REQUIRE(node0->predecessors().size() == 1);
        REQUIRE(node1->successors().size() == 1);

        SECTION("adding the same predecessor for the second time does nothing") {
            REQUIRE_FALSE(node0->addPredecessor(node1));
            REQUIRE(node0->predecessors().size() == 1);
            REQUIRE(node1->successors().size() == 1);
        }
    }

    SECTION("Removing node1 from predecessors of node0"
            " decreases size of successors of node0 and predecessors of node1") {
        REQUIRE(node0->successors().empty());
        REQUIRE(node0->addPredecessor(node1));
        auto foundNodeIterator = node0->predecessors().find(node1);
        REQUIRE_FALSE(foundNodeIterator == node0->predecessors().end());
        REQUIRE(node0->predecessors().size() == 1);
        REQUIRE(node0->removePredecessor(node1));
        REQUIRE(node0->successors().empty());
    }

    SECTION("Removing nonexistent predecessor does nothing") {
        REQUIRE(node0->predecessors().empty());
        REQUIRE_FALSE(node0->removePredecessor(node1));
        REQUIRE(node0->successors().empty());
        Node * node2 = createNode<NodeType::GENERAL>();
        REQUIRE(node0->addPredecessor(node1));
        REQUIRE(node0->predecessors().size() == 1);
        REQUIRE_FALSE(node0->removePredecessor(node2));
        REQUIRE(node0->predecessors().size() == 1);
    }

    SECTION("Adding nullptr as successor should return false") {
        REQUIRE(node0->successors().empty());
        REQUIRE_FALSE(node0->addSuccessor(nullptr));
        REQUIRE(node0->successors().empty());
    }

    SECTION("Adding nullptr as predecessor should return false") {
        REQUIRE(node0->predecessors().empty());
        REQUIRE_FALSE(node0->addPredecessor(nullptr));
        REQUIRE(node0->predecessors().empty());
    }

    SECTION("Removing nullptr from successors should return false") {
        REQUIRE(node0->successors().empty());
        REQUIRE_FALSE(node0->removeSuccessor(nullptr));
        REQUIRE(node0->successors().empty());
    }

    SECTION("Removing nullptr from predecessors should return false") {
        REQUIRE(node0->predecessors().empty());
        REQUIRE_FALSE(node0->removePredecessor(nullptr));
        REQUIRE(node0->predecessors().empty());
    }
}

TEST_CASE("Test of ThreadRegion class methods", "[ThreadRegion]") {
    auto node0 = createNode<NodeType::GENERAL>();
    auto node1 = createNode<NodeType::GENERAL>();
    ThreadRegion * threadRegion0 = new ThreadRegion(node0);
    ThreadRegion * threadRegion1 = new ThreadRegion(node1);

    REQUIRE(threadRegion0->successors().empty());
    REQUIRE(threadRegion1->successors().empty());

    SECTION("Incrementing Ids") {
        REQUIRE(threadRegion0->id() < threadRegion1->id());
    }

    SECTION("Name of node is set properly") {
        std::string dotname = "cluster" + std::to_string(threadRegion0->id());
        REQUIRE(dotname == threadRegion0->dotName());
    }

    SECTION("Add successor") {
        REQUIRE(threadRegion0->addSuccessor(threadRegion1));
        REQUIRE(threadRegion0->successors().size() == 1);
        REQUIRE(threadRegion1->predecessors().size() == 1);
    }

    SECTION("Add predecessor") {
        REQUIRE(threadRegion0->addPredecessor(threadRegion1));
        REQUIRE(threadRegion0->predecessors().size() == 1);
        REQUIRE(threadRegion1->successors().size() == 1);
    }

    SECTION("Remove existing successor") {
        threadRegion0->addSuccessor(threadRegion1);
        REQUIRE(threadRegion0->successors().size() == 1);
        REQUIRE(threadRegion0->removeSuccessor(threadRegion1));
        REQUIRE(threadRegion0->successors().empty());
    }

    SECTION("Removing existing predecessor") {
        threadRegion0->addPredecessor(threadRegion1);
        REQUIRE(threadRegion0->predecessors().size() == 1);
        REQUIRE(threadRegion0->removePredecessor(threadRegion1));
        REQUIRE(threadRegion0->predecessors().size() == 0);
    }

    SECTION("Removing nonexistent successor") {
        REQUIRE_FALSE(threadRegion0->removeSuccessor(threadRegion1));
    }

    SECTION("Removing nonexistent predecessor") {
        REQUIRE_FALSE(threadRegion0->removePredecessor(threadRegion1));
    }

    SECTION("Remove nullptr from successor") {
        REQUIRE_FALSE(threadRegion0->removeSuccessor(nullptr));
    }

    SECTION("Remove nullptr from predecessor") {
        REQUIRE_FALSE(threadRegion0->removePredecessor(nullptr));
    }
}

TEST_CASE("Test of EntryNode class methods", "[EntryNode]") {
    ForkNode * forkNode = createNode<NodeType::FORK>();
    EntryNode * entryNode = createNode<NodeType::ENTRY>();

    SECTION("Add fork predecessor") {
        REQUIRE(entryNode->addForkPredecessor(forkNode));
        REQUIRE(entryNode->forkPredecessors().size() == 1);
        REQUIRE_FALSE(entryNode->addForkPredecessor(forkNode));
        REQUIRE(entryNode->forkPredecessors().size() == 1);
        REQUIRE_FALSE(entryNode->addForkPredecessor(nullptr));
        REQUIRE(entryNode->forkPredecessors().size() == 1);
    }

    SECTION("Remove fork predecessor") {
        entryNode->addForkPredecessor(forkNode);
        REQUIRE(entryNode->forkPredecessors().size() == 1);
        REQUIRE(entryNode->removeForkPredecessor(forkNode));
        REQUIRE(entryNode->forkPredecessors().size() == 0);
        REQUIRE_FALSE(entryNode->removeForkPredecessor(forkNode));
        REQUIRE(entryNode->forkPredecessors().size() == 0);
    }
}

TEST_CASE("Test of ExitNode class methods", "[ExitNode]") {
    auto joinNode = createNode<NodeType::JOIN>();
    auto exitNode = createNode<NodeType::EXIT>();

    SECTION("Add join successor") {
        REQUIRE(exitNode->addJoinSuccessor(joinNode));
        REQUIRE(exitNode->joinSuccessors().size() == 1);
        REQUIRE_FALSE(exitNode->addJoinSuccessor(joinNode));
        REQUIRE(exitNode->joinSuccessors().size() == 1);
        REQUIRE_FALSE(exitNode->addJoinSuccessor(nullptr));
        REQUIRE(exitNode->joinSuccessors().size() == 1);
    }

    SECTION("Remove join successor") {
        exitNode->addJoinSuccessor(joinNode);
        REQUIRE(exitNode->joinSuccessors().size() == 1);
        REQUIRE(exitNode->removeJoinSuccessor(joinNode));
        REQUIRE(exitNode->joinSuccessors().size() == 0);
        REQUIRE_FALSE(exitNode->removeJoinSuccessor(joinNode));
        REQUIRE(exitNode->joinSuccessors().size() == 0);
        REQUIRE_FALSE(exitNode->removeJoinSuccessor(nullptr));
        REQUIRE(exitNode->joinSuccessors().size() == 0);
    }
}

TEST_CASE("Test of ForkNode class methods", "[ForkNode]") {
    auto forkNode = createNode<NodeType::FORK>();
    auto joinNode = createNode<NodeType::JOIN>();
    auto entryNode = createNode<NodeType::ENTRY>();

    SECTION("Add corresponding join") {
        REQUIRE(forkNode->addCorrespondingJoin(joinNode));
        REQUIRE(forkNode->correspondingJoins().size() == 1);
        REQUIRE_FALSE(forkNode->addCorrespondingJoin(joinNode));
        REQUIRE(forkNode->correspondingJoins().size() == 1);
        REQUIRE_FALSE(forkNode->addCorrespondingJoin(nullptr));
        REQUIRE(forkNode->correspondingJoins().size() == 1);
    }

    SECTION("Add fork successor") {
        REQUIRE(forkNode->addForkSuccessor(entryNode));
        REQUIRE(forkNode->forkSuccessors().size() == 1);
        REQUIRE_FALSE(forkNode->addForkSuccessor(entryNode));
        REQUIRE(forkNode->forkSuccessors().size() == 1);
        REQUIRE_FALSE(forkNode->addForkSuccessor(nullptr));
        REQUIRE(forkNode->forkSuccessors().size() == 1);
    }

    SECTION("Remove fork successor") {
        forkNode->addForkSuccessor(entryNode);
        REQUIRE(forkNode->forkSuccessors().size() == 1);
        REQUIRE(forkNode->removeForkSuccessor(entryNode));
        REQUIRE(forkNode->forkSuccessors().size() == 0);
        REQUIRE_FALSE(forkNode->removeForkSuccessor(entryNode));
        REQUIRE(forkNode->forkSuccessors().size() == 0);
        REQUIRE_FALSE(forkNode->removeForkSuccessor(nullptr));
        REQUIRE(forkNode->forkSuccessors().size() == 0);
    }
}

TEST_CASE("Test of JoinNode class methods", "[JoinNode]") {
    auto joinNode = createNode<NodeType::JOIN>();
    auto forkNode = createNode<NodeType::FORK>();
    auto exitNode = createNode<NodeType::EXIT>();


    SECTION("Add corresponding fork") {
        REQUIRE(joinNode->addCorrespondingFork(forkNode));
        REQUIRE(joinNode->correspondingForks().size() == 1);
        REQUIRE_FALSE(joinNode->addCorrespondingFork(forkNode));
        REQUIRE(joinNode->correspondingForks().size() == 1);
        REQUIRE_FALSE(joinNode->addCorrespondingFork(nullptr));
        REQUIRE(joinNode->correspondingForks().size() == 1);
    }

    SECTION("Add join predecessor") {
        REQUIRE(joinNode->addJoinPredecessor(exitNode));
        REQUIRE(joinNode->joinPredecessors().size() == 1);
        REQUIRE_FALSE(joinNode->addJoinPredecessor(exitNode));
        REQUIRE(joinNode->joinPredecessors().size() == 1);
        REQUIRE_FALSE(joinNode->addJoinPredecessor(nullptr));
        REQUIRE(joinNode->joinPredecessors().size() == 1);
    }

    SECTION("Remove join predecessor") {
        joinNode->addJoinPredecessor(exitNode);
        REQUIRE(joinNode->joinPredecessors().size() == 1);
        REQUIRE(joinNode->removeJoinPredecessor(exitNode));
        REQUIRE(joinNode->joinPredecessors().size() == 0);
        REQUIRE_FALSE(joinNode->removeJoinPredecessor(exitNode));
        REQUIRE(joinNode->joinPredecessors().size() == 0);
        REQUIRE_FALSE(joinNode->removeJoinPredecessor(nullptr));
        REQUIRE(joinNode->joinPredecessors().size() == 0);
    }
}

TEST_CASE("Test of LockNode class methods", "[LockNode]") {
    auto lockNode = createNode<NodeType::LOCK>();
    auto unlockNode = createNode<NodeType::UNLOCK>();

    SECTION("Add corresponding unlock") {
        REQUIRE(lockNode->addCorrespondingUnlock(unlockNode));
        REQUIRE(lockNode->correspondingUnlocks().size() == 1);
        REQUIRE_FALSE(lockNode->addCorrespondingUnlock(unlockNode));
        REQUIRE(lockNode->correspondingUnlocks().size() == 1);
        REQUIRE_FALSE(lockNode->addCorrespondingUnlock(nullptr));
        REQUIRE(lockNode->correspondingUnlocks().size() == 1);
    }
}

TEST_CASE("Test of GraphBuilder class methods", "[GraphBuilder]") {
    using namespace llvm;
    LLVMContext context;
    SMDiagnostic SMD;
#if ((LLVM_VERSION_MAJOR == 3) && (LLVM_VERSION_MINOR < 5))
    std::unique_ptr<Module> M(ParseIRFile(SIMPLE_FILE, SMD, context));
#else
    std::unique_ptr<Module> M = parseIRFile(SIMPLE_FILE, SMD, context);
#endif
    const Function * function = M->getFunction("sum");
    dg::LLVMPointerAnalysis pointsToAnalysis(M.get(), "main", dg::analysis::Offset::UNKNOWN, true);
    pointsToAnalysis.run<dg::analysis::pta::PointerAnalysisFI>();
    std::unique_ptr<GraphBuilder> graphBuilder(new GraphBuilder(&pointsToAnalysis));

    SECTION("Test of buildInstruction and findInstruction") {
        auto inst = graphBuilder->buildInstruction(nullptr);
        REQUIRE(inst.first == nullptr);
        REQUIRE(inst.second == nullptr);
        REQUIRE_FALSE(graphBuilder->findInstruction(nullptr));
        for (auto & block : *function) {
            for (auto & instruction : block) {
                inst = graphBuilder->buildInstruction(&instruction);
                REQUIRE_FALSE(inst.first == nullptr);
                REQUIRE_FALSE(inst.second == nullptr);
                auto instructionNode = graphBuilder->findInstruction(&instruction);
                REQUIRE_FALSE(instructionNode == nullptr);
                inst = graphBuilder->buildInstruction(&instruction);
                REQUIRE(inst.first == nullptr);
                REQUIRE(inst.second == nullptr);
            }
        }
    }

    SECTION("Test of buildBlock and findBlock") {
        auto nodeSeq = graphBuilder->buildBlock(nullptr);
        REQUIRE_FALSE(graphBuilder->findBlock(nullptr));
        REQUIRE(nodeSeq.first == nullptr);
        REQUIRE(nodeSeq.second == nullptr);
        for (auto & block : *function) {
            nodeSeq = graphBuilder->buildBlock(&block);
            REQUIRE_FALSE(nodeSeq.first == nullptr);
            REQUIRE_FALSE(nodeSeq.second == nullptr);
            auto blockGraph = graphBuilder->findBlock(&block);
            REQUIRE_FALSE(blockGraph == nullptr);
            nodeSeq = graphBuilder->buildBlock(&block);
            REQUIRE(nodeSeq.first == nullptr);
            REQUIRE(nodeSeq.second == nullptr);
        }
    }

    SECTION("Test of buildFunction and findFunction") {
        auto nodeSeq = graphBuilder->buildFunction(nullptr);
        REQUIRE(nodeSeq.first == nullptr);
        REQUIRE(nodeSeq.second == nullptr);
        REQUIRE_FALSE(graphBuilder->findFunction(nullptr));

        for (auto & function : M->getFunctionList()) {
            nodeSeq = graphBuilder->buildFunction(&function);
            REQUIRE_FALSE(nodeSeq.first == nullptr);
            REQUIRE_FALSE(nodeSeq.second == nullptr);
            auto functionGraph = graphBuilder->findFunction(&function);
            REQUIRE_FALSE(functionGraph == nullptr);
            nodeSeq = graphBuilder->buildFunction(&function);
            REQUIRE(nodeSeq.first == nullptr);
            REQUIRE(nodeSeq.second == nullptr);
        }
    }
}

TEST_CASE("GraphBuilder build tests", "[GraphBuilder]") {
    using namespace llvm;
    LLVMContext context;
    SMDiagnostic SMD;
#if ((LLVM_VERSION_MAJOR == 3) && (LLVM_VERSION_MINOR < 5))    
    std::unique_ptr<Module> M(ParseIRFile(PTHREAD_EXIT_FILE, SMD, context)); 
#else
    std::unique_ptr<Module> M = parseIRFile(PTHREAD_EXIT_FILE, SMD, context); 
#endif    
    dg::LLVMPointerAnalysis pointsToAnalysis(M.get(), "main", dg::analysis::Offset::UNKNOWN, true);
    pointsToAnalysis.run<dg::analysis::pta::PointerAnalysisFI>();
    std::unique_ptr<GraphBuilder> graphBuilder(new GraphBuilder(&pointsToAnalysis));

    SECTION("Undefined function which is not really important for us") {
        auto function = M->getFunction("free");
        auto nodeSeq = graphBuilder->buildFunction(function);
        REQUIRE(nodeSeq.first == nodeSeq.second);
    }

    SECTION("Pthread exit") {
        auto function = M->getFunction("func");
        std::set<const llvm::Instruction *> callInstruction;

        const llvm::CallInst * pthreadExitCall = nullptr;
        for (auto & block : *function) {
            for (auto & instruction : block) {
                if (isa<llvm::CallInst>(instruction)) {
                    auto callInst = dyn_cast<llvm::CallInst>(&instruction);
                    auto calledValue = callInst->getCalledValue();
                    if (isa<llvm::Function>(calledValue)) {
                        auto function = dyn_cast<llvm::Function>(calledValue);
                        if (function->getName().equals("pthread_exit")) {
                            pthreadExitCall = callInst;
                        }
                    }
                }
            }
        } 

        REQUIRE(pthreadExitCall != nullptr);
        auto nodeSeq = graphBuilder->buildInstruction(pthreadExitCall);
        REQUIRE(nodeSeq.first != nodeSeq.second);
        REQUIRE(nodeSeq.second->getType() == NodeType::RETURN);
        REQUIRE_FALSE(nodeSeq.first->isArtificial());
        REQUIRE(nodeSeq.second->isArtificial());
        REQUIRE(nodeSeq.first->successors().size() == 1);
        REQUIRE(nodeSeq.second->predecessors().size() == 1);
        REQUIRE(nodeSeq.first->successors().find(nodeSeq.second) != nodeSeq.first->successors().end());
    }

    SECTION("Func pointer call") {
        auto function = M->getFunction("main");
        std::set<const llvm::Instruction *> callInstruction;

        for (auto & block : *function) {
            for (auto & instruction : block) {
                if (isa<llvm::CallInst>(instruction)) {
                    callInstruction.insert(&instruction);
                }
            }
        }
        
        const llvm::CallInst * funcPtrCall = nullptr;

        for (auto instruction : callInstruction) {
            auto callInst = dyn_cast<llvm::CallInst>(instruction);
            auto calledValue = callInst->getCalledValue();
            if (!isa<llvm::Function>(calledValue)) {
                funcPtrCall = callInst;
            }
        }
        
        REQUIRE(funcPtrCall != nullptr);

        auto nodeSeq = graphBuilder->buildInstruction(funcPtrCall);
        REQUIRE(nodeSeq.first != nullptr);
        REQUIRE(nodeSeq.second != nullptr);
        REQUIRE_FALSE(nodeSeq.first->isArtificial());
        REQUIRE(nodeSeq.first->successors().size() == 1);
        auto successor = nodeSeq.first->successors();
        for (auto node : nodeSeq.first->successors()) {
            REQUIRE(node->isArtificial());
        }
        std::queue<Node *> queue;
        std::set<Node *> visited;

        REQUIRE(nodeSeq.first->getType() == NodeType::CALL_FUNCPTR);
        REQUIRE(nodeSeq.second->getType() == NodeType::FORK);
        auto fork = castNode<NodeType::FORK>(nodeSeq.second);
        REQUIRE(fork->forkSuccessors().size() == 1);
        visited.insert(*fork->forkSuccessors().begin());
        queue.push(*fork->forkSuccessors().begin());
        while (!queue.empty()) {
            Node * currentNode = queue.front();
            queue.pop();
            for (auto successor : currentNode->successors()) {
                if (visited.find(successor) == visited.end()) {
                    visited.insert(successor);
                    queue.push(successor);
                }
            }
        }
        std::set<Node *> realNodes;
        for (auto node : visited) {
            if (!node->isArtificial()) {
                realNodes.insert(node);
            }
        }
        REQUIRE(realNodes.size() > 30);
        REQUIRE(realNodes.size() < 60);
    }

    SECTION("ForkNode iterator test") {
        auto forkNode = createNode<NodeType::FORK>();

        auto entryNode0 = createNode<NodeType::ENTRY>();

        forkNode->addForkSuccessor(entryNode0);

        auto node0 = createNode<NodeType::GENERAL>();

        forkNode->addSuccessor(node0);

        int i = 0;

        for (auto it = forkNode->begin(), end = forkNode->end(); it != end; ++it) {
            ++i;
        }

        REQUIRE(i == 2);
    }
}
