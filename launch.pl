#!/usr/bin/env perl

use v5.38;
use FindBin '$RealBin';

chdir "$RealBin";

exec 'carton exec -- morbo -w . -v script/foo';
