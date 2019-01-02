//
//  AllLaunches.swift
//  fakePassionProject
//
//  Created by Pursuit on 12/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

struct AllSpaceXLaunches: Codable {
    let flight_number: Int
    let mission_name: String
    let launch_year: String
    let launch_date_local: String
    let rocket: RocketInfo?
    let launch_site: launchInfo
    let launch_success: Bool?
    let launch_failure_details: LaunchFailures?
    let links: LinksInfo?
    let details: String?
}
struct RocketInfo: Codable {
    let rocket_name: String
    let second_stage: SecondStageInfo?
}
struct SecondStageInfo : Codable {
    let payloads: [payloadInfo]?
    }

struct payloadInfo: Codable {
    let customers: [String]
    let nationality: String?
    let manufacturer: String?
    let payload_type: String?
    let  orbit: String
}

struct launchInfo: Codable {
    let site_name_long: String
}

struct LaunchFailures: Codable{
    let time : Int
    let reason: String
}
struct LinksInfo: Codable {
    let mission_patch : String?
    let mission_patch_small: String?
    let article_link: String?
    let video_link: String?
    let flickr_images: [String]?
}

