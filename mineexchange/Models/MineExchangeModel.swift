//
//  MineExchangeModel.swift
//  mineexchange
//
//  Created by Frd on 20/08/24.
//

import Foundation

struct MineExchangeModel : Codable {
    let status_code : Int?
    let status : Bool?
    let message : String?
    let data : [Data]?

    enum CodingKeys: String, CodingKey {

        case status_code = "status_code"
        case status = "status"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status_code = try values.decodeIfPresent(Int.self, forKey: .status_code)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
    }

}

struct Data : Codable {
    let location : Location?
    let _id : String?
    let seller_id : Seller_id?
    let image : [Image]?
    let project_number : Int?
    let is_promoted : Bool?
    let is_answering : Bool?
    let is_banner_promoted : Bool?
    let is_deleted : Bool?
    let status : Int?
    let created_at : String?
    let address : String?
    let commodity : String?
    let commodity_sector : [String]?
    let company_name : String?
    let country : String?
    let description : String?
    let development_stage : String?
    let intension : String?
    let name : String?
    let price_range : String?
    let region : String?
    let signature_image : String?
    let continent : String?
    let is_agent_approved : Bool?
    let is_dummy : Bool?
    let is_owner_approved : Bool?
    let is_enquired : Bool?

    enum CodingKeys: String, CodingKey {

        case location = "location"
        case _id = "_id"
        case seller_id = "seller_id"
        case image = "image"
        case project_number = "project_number"
        case is_promoted = "is_promoted"
        case is_answering = "is_answering"
        case is_banner_promoted = "is_banner_promoted"
        case is_deleted = "is_deleted"
        case status = "status"
        case created_at = "created_at"
        case address = "address"
        case commodity = "commodity"
        case commodity_sector = "commodity_sector"
        case company_name = "company_name"
        case country = "country"
        case description = "description"
        case development_stage = "development_stage"
        case intension = "intension"
        case name = "name"
        case price_range = "price_range"
        case region = "region"
        case signature_image = "signature_image"
        case continent = "continent"
        case is_agent_approved = "is_agent_approved"
        case is_dummy = "is_dummy"
        case is_owner_approved = "is_owner_approved"
        case is_enquired = "is_enquired"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        location = try values.decodeIfPresent(Location.self, forKey: .location)
        _id = try values.decodeIfPresent(String.self, forKey: ._id)
        seller_id = try values.decodeIfPresent(Seller_id.self, forKey: .seller_id)
        image = try values.decodeIfPresent([Image].self, forKey: .image)
        project_number = try values.decodeIfPresent(Int.self, forKey: .project_number)
        is_promoted = try values.decodeIfPresent(Bool.self, forKey: .is_promoted)
        is_answering = try values.decodeIfPresent(Bool.self, forKey: .is_answering)
        is_banner_promoted = try values.decodeIfPresent(Bool.self, forKey: .is_banner_promoted)
        is_deleted = try values.decodeIfPresent(Bool.self, forKey: .is_deleted)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        commodity = try values.decodeIfPresent(String.self, forKey: .commodity)
        commodity_sector = try values.decodeIfPresent([String].self, forKey: .commodity_sector)
        company_name = try values.decodeIfPresent(String.self, forKey: .company_name)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        development_stage = try values.decodeIfPresent(String.self, forKey: .development_stage)
        intension = try values.decodeIfPresent(String.self, forKey: .intension)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        price_range = try values.decodeIfPresent(String.self, forKey: .price_range)
        region = try values.decodeIfPresent(String.self, forKey: .region)
        signature_image = try values.decodeIfPresent(String.self, forKey: .signature_image)
        continent = try values.decodeIfPresent(String.self, forKey: .continent)
        is_agent_approved = try values.decodeIfPresent(Bool.self, forKey: .is_agent_approved)
        is_dummy = try values.decodeIfPresent(Bool.self, forKey: .is_dummy)
        is_owner_approved = try values.decodeIfPresent(Bool.self, forKey: .is_owner_approved)
        is_enquired = try values.decodeIfPresent(Bool.self, forKey: .is_enquired)
    }

}



struct Location : Codable {
    let type : String?
    let coordinates : [Double]?

    enum CodingKeys: String, CodingKey {

        case type = "type"
        case coordinates = "coordinates"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        coordinates = try values.decodeIfPresent([Double].self, forKey: .coordinates)
    }

}

struct Seller_id : Codable {
    let _id : String?
    let first_name : String?
    let last_name : String?
    let email : String?
    let password : String?
    let google_signin : Bool?
    let apple_signin : Bool?
    let is_seller : Bool?
    let is_broker : Bool?
    let live_project_urls : [String]?
    let sold_project_urls : [String]?
    let profile_completed : Bool?
    let average_rating : Int?
    let email_verified : Bool?
    let email_notification : Bool?
    let saved_search_notification : Bool?
    let is_deleted : Bool?
    let status : Int?
    let created_at : String?
    let date_of_birth : String?
    let gender : String?
    let language : String?
    let occupation : String?
    let phone_number : String?
    let summary : String?
    let company_logo : String?
    let company_name : String?
    let company_website : String?
    let experience : String?
    let location : String?
    let position : String?
    let bio : String?
    let colour_code : String?
    let text_colour : String?
    let is_company_logo : Bool?
    let reset_token : String?
    let token_expires : String?
    let profile_picture : String?
    let otp : Int?
    let is_dark_mode : Bool?
    let linkedin : String?

    enum CodingKeys: String, CodingKey {

        case _id = "_id"
        case first_name = "first_name"
        case last_name = "last_name"
        case email = "email"
        case password = "password"
        case google_signin = "google_signin"
        case apple_signin = "apple_signin"
        case is_seller = "is_seller"
        case is_broker = "is_broker"
        case live_project_urls = "live_project_urls"
        case sold_project_urls = "sold_project_urls"
        case profile_completed = "profile_completed"
        case average_rating = "average_rating"
        case email_verified = "email_verified"
        case email_notification = "email_notification"
        case saved_search_notification = "saved_search_notification"
        case is_deleted = "is_deleted"
        case status = "status"
        case created_at = "created_at"
        case date_of_birth = "date_of_birth"
        case gender = "gender"
        case language = "language"
        case occupation = "occupation"
        case phone_number = "phone_number"
        case summary = "summary"
        case company_logo = "company_logo"
        case company_name = "company_name"
        case company_website = "company_website"
        case experience = "experience"
        case location = "location"
        case position = "position"
        case bio = "bio"
        case colour_code = "colour_code"
        case text_colour = "text_colour"
        case is_company_logo = "is_company_logo"
        case reset_token = "reset_token"
        case token_expires = "token_expires"
        case profile_picture = "profile_picture"
        case otp = "otp"
        case is_dark_mode = "is_dark_mode"
        case linkedin = "linkedin"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        _id = try values.decodeIfPresent(String.self, forKey: ._id)
        first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
        last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        google_signin = try values.decodeIfPresent(Bool.self, forKey: .google_signin)
        apple_signin = try values.decodeIfPresent(Bool.self, forKey: .apple_signin)
        is_seller = try values.decodeIfPresent(Bool.self, forKey: .is_seller)
        is_broker = try values.decodeIfPresent(Bool.self, forKey: .is_broker)
        live_project_urls = try values.decodeIfPresent([String].self, forKey: .live_project_urls)
        sold_project_urls = try values.decodeIfPresent([String].self, forKey: .sold_project_urls)
        profile_completed = try values.decodeIfPresent(Bool.self, forKey: .profile_completed)
        average_rating = try values.decodeIfPresent(Int.self, forKey: .average_rating)
        email_verified = try values.decodeIfPresent(Bool.self, forKey: .email_verified)
        email_notification = try values.decodeIfPresent(Bool.self, forKey: .email_notification)
        saved_search_notification = try values.decodeIfPresent(Bool.self, forKey: .saved_search_notification)
        is_deleted = try values.decodeIfPresent(Bool.self, forKey: .is_deleted)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        date_of_birth = try values.decodeIfPresent(String.self, forKey: .date_of_birth)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        language = try values.decodeIfPresent(String.self, forKey: .language)
        occupation = try values.decodeIfPresent(String.self, forKey: .occupation)
        phone_number = try values.decodeIfPresent(String.self, forKey: .phone_number)
        summary = try values.decodeIfPresent(String.self, forKey: .summary)
        company_logo = try values.decodeIfPresent(String.self, forKey: .company_logo)
        company_name = try values.decodeIfPresent(String.self, forKey: .company_name)
        company_website = try values.decodeIfPresent(String.self, forKey: .company_website)
        experience = try values.decodeIfPresent(String.self, forKey: .experience)
        location = try values.decodeIfPresent(String.self, forKey: .location)
        position = try values.decodeIfPresent(String.self, forKey: .position)
        bio = try values.decodeIfPresent(String.self, forKey: .bio)
        colour_code = try values.decodeIfPresent(String.self, forKey: .colour_code)
        text_colour = try values.decodeIfPresent(String.self, forKey: .text_colour)
        is_company_logo = try values.decodeIfPresent(Bool.self, forKey: .is_company_logo)
        reset_token = try values.decodeIfPresent(String.self, forKey: .reset_token)
        token_expires = try values.decodeIfPresent(String.self, forKey: .token_expires)
        profile_picture = try values.decodeIfPresent(String.self, forKey: .profile_picture)
        otp = try values.decodeIfPresent(Int.self, forKey: .otp)
        is_dark_mode = try values.decodeIfPresent(Bool.self, forKey: .is_dark_mode)
        linkedin = try values.decodeIfPresent(String.self, forKey: .linkedin)
    }

}

struct Image : Codable {
    let name : String?
    let url : String?
    let file_type : String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case url = "url"
        case file_type = "file_type"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        file_type = try values.decodeIfPresent(String.self, forKey: .file_type)
    }

}

