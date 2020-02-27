#!/bin/bash

set -e

TEST=$1

echo "Test with PTA FI & RDA data-flow"
DG_TESTS_PTA=fi DG_TESTS_RDA=dataflow ./$TEST

echo "Test with PTA FI & RDA ssa"
DG_TESTS_PTA=fi DG_TESTS_RDA=ssa ./$TEST

echo "Test with PTA FI & RDA ssa & CD ntscd"
DG_TESTS_PTA=fi DG_TESTS_RDA=ssa DG_TESTS_CDA=ntscd ./$TEST

echo "Test with PTA FI & RDA dataflow & CD ntscd"
DG_TESTS_PTA=fs DG_TESTS_RDA=dataflow DG_TESTS_CDA=ntscd ./$TEST

