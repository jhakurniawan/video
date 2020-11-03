//
//  Constants.swift
//  video
//
//  Created by rizky on 02/11/20.
//

import Foundation

struct Constant {
    static var API_KEY = ""
    static var PLAYLIST_ID = "UUJHC3VbFsp7kJ2NxPGltwiw"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constant.PLAYLIST_ID)&key=\(Constant.API_KEY)"
}
