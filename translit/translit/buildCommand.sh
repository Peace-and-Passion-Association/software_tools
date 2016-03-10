#!/bin/sh

#  buildCommand.sh
#  translit
#
#  Created by 相川　和希 on 2016/03/10.
#  Copyright © 2016年 AikawaKazuki. All rights reserved.
xcrun -sdk macosx swiftc -o translit main.swift ../../software-tools-swift/fileHandler.swift ../../software-tools-swift/getPut.swift  ../../software-tools-swift/common.swift  ../../software-tools-swift/translit.swift