#!/bin/sh

#  buildCommand.sh
#  compress
#
#  Created by 相川　和希 on 2016/02/23.
#  Copyright © 2016年 AikawaKazuki. All rights reserved.
xcrun -sdk macosx swiftc -o expand main.swift ../../software-tools-swift/fileHandler.swift ../../software-tools-swift/getPut.swift ../../software-tools-swift/bufferStreamWrapper.swift ../../software-tools-swift/compress.swift ../../software-tools-swift/expand.swift