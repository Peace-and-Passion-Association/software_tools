#!/bin/sh

#  buildCommand.sh
#  calc
#
#  Created by 相川　和希 on 2016/02/26.
#  Copyright © 2016年 AikawaKazuki. All rights reserved.
xcrun -sdk macosx swiftc -o calc main.swift ../../software-tools-swift/fileHandler.swift ../../software-tools-swift/bufferStreamWrapper.swift ../../software-tools-swift/calc.swift


# example ./calc 3 \* \( 2 + 3 \* \( 2 + 2 \) \) / 7 =