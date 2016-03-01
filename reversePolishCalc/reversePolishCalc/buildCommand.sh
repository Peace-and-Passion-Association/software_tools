#!/bin/sh

#  buildCommand.sh
#  reversePolishCalc
#
#  Created by 相川　和希 on 2016/03/01.
#  Copyright © 2016年 AikawaKazuki. All rights reserved.

xcrun -sdk macosx swiftc -o reversePolishCalc main.swift ../../software-tools-swift/fileHandler.swift ../../software-tools-swift/bufferStreamWrapper.swift ../../software-tools-swift/calc.swift
