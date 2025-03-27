//
//  PersonalDetailsModel.swift
//  Task
//
//  Created by G Ajay on 21/02/25.
//

import Foundation

// MARK: - Welcome
struct MainUser: Codable {
    let user: User
}

// MARK: - WelcomeUser
struct User: Codable {
    let id: Int?
    let avatarFileAttachmentURL, thumbnailAttachmentURL: String?
    let firstName, lastName: String?
    let roles: [String]?
    let mobileNumber: String?
    let email: String?
    let clubDetails: [String]?
    let recentMatches, commonEvents: [CommonEvent]?
    let commonTeams: [CommonTeam]?
    let recentCourts: [RecentCourt]?
    let parent: Parent?

    enum CodingKeys: String, CodingKey {
        case id
        case avatarFileAttachmentURL = "avatar_file_attachment_url"
        case thumbnailAttachmentURL = "thumbnail_attachment_url"
        case firstName = "first_name"
        case lastName = "last_name"
        case roles
        case mobileNumber = "mobile_number"
        case email
        case clubDetails = "club_details"
        case recentMatches = "recent_matches"
        case commonEvents = "common_events"
        case commonTeams = "common_teams"
        case recentCourts = "recent_courts"
        case parent
    }
}

// MARK: - Parent
struct Parent: Codable {
    let id: Int?
    let firstName, lastName, mobileNumber: String?
    let email: String?
    let isSignedUp: Bool?
    let parentUserID: Int?
    let avatarFileAttachmentURL, thumbnailAttachmentURL: String?
    let roles: [String]?
    let clubDetails: [String]?
    let uid: String?

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case mobileNumber = "mobile_number"
        case email
        case isSignedUp = "is_signed_up"
        case parentUserID = "parent_user_id"
        case avatarFileAttachmentURL = "avatar_file_attachment_url"
        case thumbnailAttachmentURL = "thumbnail_attachment_url"
        case roles
        case clubDetails = "club_details"
        case uid
    }
}


// MARK: - CommonEvent
struct CommonEvent: Codable {
    let id: Int?
    let eventType: String?
    let leagueScheduleName: String?
    let firstStartTime: String?
    let teamName: String?
    let eventCourts: [EventCourt]?
    let eventCoaches: [EventCoach]?
    let eventAudiences: [EventAudience]?

    enum CodingKeys: String, CodingKey {
        case id
        case eventType = "event_type"
        case leagueScheduleName = "league_schedule_name"
        case firstStartTime = "first_start_time"
        case teamName = "team_name"
        case eventCourts = "event_courts"
        case eventCoaches = "event_coaches"
        case eventAudiences = "event_audiences"
    }
}

// MARK: - EventCourt
struct EventCourt: Codable {
    let id: Int?
    let matchType, startTime, endTime: String?
    let rescheduledAt: String?
    let order: Int?
    let cancelledAt: String?
    let status: String?
    let eventCourtPlayers: [EventCourtPlayer]?

    enum CodingKeys: String, CodingKey {
        case id
        case matchType = "match_type"
        case startTime = "start_time"
        case endTime = "end_time"
        case rescheduledAt = "rescheduled_at"
        case order
        case cancelledAt = "cancelled_at"
        case status
        case eventCourtPlayers = "event_court_players"
    }
}

// MARK: - EventCourtPlayer
struct EventCourtPlayer: Codable {
    let id, eventCourtID, courtSideID: Int?
    let position: String?
    let user: EventCourtPlayerUser?

    enum CodingKeys: String, CodingKey {
        case id
        case eventCourtID = "event_court_id"
        case courtSideID = "court_side_id"
        case position, user
    }
}

// MARK: - EventCourtPlayerUser
struct EventCourtPlayerUser: Codable {
    let id: Int?
    let firstName, lastName: String?
    let avatarFileAttachmentURL, thumbnailAttachmentURL: String?

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case avatarFileAttachmentURL = "avatar_file_attachment_url"
        case thumbnailAttachmentURL = "thumbnail_attachment_url"
    }
}

// MARK: - EventPlayer
struct EventPlayer: Codable {
    let id: Int?
    let role, position: String?
    let teamID: Int?
    let courtSideID: Int?
    let isPlayer, isCoach: Bool?
    let user: EventPlayerUser?

    enum CodingKeys: String, CodingKey {
        case id, role, position
        case teamID = "team_id"
        case courtSideID = "court_side_id"
        case isPlayer = "is_player"
        case isCoach = "is_coach"
        case user
    }
}

// MARK: - EventPlayerUser
struct EventPlayerUser: Codable {
    let id: Int?
    let firstName, lastName: String?
    let avatarFileAttachmentURL, thumbnailAttachmentURL: String?

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case avatarFileAttachmentURL = "avatar_file_attachment_url"
        case thumbnailAttachmentURL = "thumbnail_attachment_url"
    }
}

// MARK: - CommonTeam
struct CommonTeam: Codable {
    let id: Int?
    let name: String?
    let teamPlayers: [TeamPlayer]?

    enum CodingKeys: String, CodingKey {
        case id, name
        case teamPlayers = "team_players"
    }
}

// MARK: - TeamPlayer
struct TeamPlayer: Codable {
    let id: Int?
    let isCaptain, isPlayer, isCoach: Bool?

    enum CodingKeys: String, CodingKey {
        case id
        case isCaptain = "is_captain"
        case isPlayer = "is_player"
        case isCoach = "is_coach"
    }
}

// MARK: - RecentCourt
struct RecentCourt: Codable {
    let id: Int?
    let matchType: String?
    let startTime, endTime: String?
    let order: Int?
    let notesForCourt: String?
    let courtShortName, courtFullName, status: String?
    let place: Place?

    enum CodingKeys: String, CodingKey {
        case id
        case matchType = "match_type"
        case startTime = "start_time"
        case endTime = "end_time"
        case order
        case notesForCourt = "notes_for_court"
        case courtShortName = "court_short_name"
        case courtFullName = "court_full_name"
        case status, place
    }
}

// MARK: - Place
struct Place: Codable {
    let id: Int?
    let name, address, contactNumber, website: String?
    let distance: String?
    let placeType: String?
    let addressDetail: AddressDetail?

    enum CodingKeys: String, CodingKey {
        case id, name, address
        case contactNumber = "contact_number"
        case website, distance
        case placeType = "place_type"
        case addressDetail = "address_detail"
    }
}

// MARK: - AddressDetail
struct AddressDetail: Codable {
    let id: Int?
    let deliveryLine1: String?
    let lastLine: String?
    let cityName: String?
    let plus4Code, primaryNumber: String?
    let stateAbbreviation: String?
    let streetName, streetSuffix: String?
    let zipcode: String?
    let congressionalDistrict, countyFIPS: String?
    let countyName, latitude, longitude: String?
    let active: Bool?

    enum CodingKeys: String, CodingKey {
        case id
        case deliveryLine1 = "delivery_line_1"
        case lastLine = "last_line"
        case cityName = "city_name"
        case plus4Code = "plus4_code"
        case primaryNumber = "primary_number"
        case stateAbbreviation = "state_abbreviation"
        case streetName = "street_name"
        case streetSuffix = "street_suffix"
        case zipcode
        case congressionalDistrict = "congressional_district"
        case countyFIPS = "county_fips"
        case countyName = "county_name"
        case latitude, longitude, active
    }
}

// MARK: - EventCoach
struct EventCoach: Codable {
    let id: Int?
    let role: String?
    let position: String?
    let teamID: Int?
    let courtSideID: Int?
    let isPlayer: Bool?
    let isCoach: Bool?
    let user: EventCoachUser?

    enum CodingKeys: String, CodingKey {
        case id, role, position
        case teamID = "team_id"
        case courtSideID = "court_side_id"
        case isPlayer = "is_player"
        case isCoach = "is_coach"
        case user
    }
}

// MARK: - EventCoachUser
struct EventCoachUser: Codable {
    let id: Int?
    let firstName, lastName: String?
    let avatarFileAttachmentURL, thumbnailAttachmentURL: String?

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case avatarFileAttachmentURL = "avatar_file_attachment_url"
        case thumbnailAttachmentURL = "thumbnail_attachment_url"
    }
}

//MARK: - EventAudience
struct EventAudience: Codable {
    
}

//MARK: - RecentMatch
//struct RecentMatch:Codable {
//    let id:Int?
//}

//This is the structure for Recnt matches hard coded data

//struct RecentMatchesModel:Identifiable  {
//    let id = UUID()
//    let matchName: String
//    let matchDate: String
//    let matchTime: String
//    let matchType:String
//}
