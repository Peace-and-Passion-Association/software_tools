#!/bin/sh

#  buildCommand.sh
#  compare
#
#  Created by 相川　和希 on 2016/03/02.
#  Copyright © 2016年 AikawaKazuki. All rights reserved.
xcrun -sdk macosx swiftc -o compare main.swift ../../software-tools-swift/fileHandler.swift ../../software-tools-swift/getPut.swift ../../software-tools-swift/bufferStreamWrapper.swift ../../software-tools-swift/common.swift ../../software-tools-swift/argParser.swift ../../software-tools-swift/compare.swift