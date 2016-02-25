#!/bin/sh

#  buildCommand.sh
#  tail
#
#  Created by 相川　和希 on 2016/02/25.
#  Copyright © 2016年 AikawaKazuki. All rights reserved.
xcrun -sdk macosx swiftc -o tail main.swift ../../software-tools-swift/fileHandler.swift ../../software-tools-swift/getPut.swift ../../software-tools-swift/bufferStreamWrapper.swift ../../software-tools-swift/common.swift ../../software-tools-swift/argParser.swift ../../software-tools-swift/tail.swift