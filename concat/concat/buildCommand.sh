#!/bin/sh

#  buildCommand.sh
#  concat
#
#  Created by 相川　和希 on 2016/03/02.
#  Copyright © 2016年 AikawaKazuki. All rights reserved.
xcrun -sdk macosx swiftc -o concat main.swift ../../software-tools-swift/fileHandler.swift ../../software-tools-swift/common.swift  ../../software-tools-swift/concat.swift