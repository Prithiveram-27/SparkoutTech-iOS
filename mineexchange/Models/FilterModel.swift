//
//  FilterModel.swift
//  mineexchange
//
//  Created by Frd on 21/08/24.
//

import Foundation

struct FilterModel : Codable {
    let status_code : Int?
    let status : Bool?
    let message : String?
    let data : DataModel?

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
        data = try values.decodeIfPresent(DataModel.self, forKey: .data)
    }

}

struct DataModel : Codable {
    let filters : [Filters]?
    let price_range : Price_range?
    let commodities : [String]?
    let continents : [String]?

    enum CodingKeys: String, CodingKey {

        case filters = "filters"
        case price_range = "price_range"
        case commodities = "commodities"
        case continents = "continents"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        filters = try values.decodeIfPresent([Filters].self, forKey: .filters)
        price_range = try values.decodeIfPresent(Price_range.self, forKey: .price_range)
        commodities = try values.decodeIfPresent([String].self, forKey: .commodities)
        continents = try values.decodeIfPresent([String].self, forKey: .continents)
    }

}

struct Filters : Codable {
    let _id : String?
    let question : String?
    let type : String?
    let prompts : [Prompts]?
    let step : String?
    let section : String?
    let question_no : Int?
    let mandatory : Bool?
    let is_filter : Bool?
    let label : String?
    let key : String?
    let status : Int?
    let created_at : String?

    enum CodingKeys: String, CodingKey {

        case _id = "_id"
        case question = "question"
        case type = "type"
        case prompts = "prompts"
        case step = "step"
        case section = "section"
        case question_no = "question_no"
        case mandatory = "mandatory"
        case is_filter = "is_filter"
        case label = "label"
        case key = "key"
        case status = "status"
        case created_at = "created_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        _id = try values.decodeIfPresent(String.self, forKey: ._id)
        question = try values.decodeIfPresent(String.self, forKey: .question)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        prompts = try values.decodeIfPresent([Prompts].self, forKey: .prompts)
        step = try values.decodeIfPresent(String.self, forKey: .step)
        section = try values.decodeIfPresent(String.self, forKey: .section)
        question_no = try values.decodeIfPresent(Int.self, forKey: .question_no)
        mandatory = try values.decodeIfPresent(Bool.self, forKey: .mandatory)
        is_filter = try values.decodeIfPresent(Bool.self, forKey: .is_filter)
        label = try values.decodeIfPresent(String.self, forKey: .label)
        key = try values.decodeIfPresent(String.self, forKey: .key)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
    }

}

struct Prompts : Codable {
    let prompt_values : String?
    let nested_Prompts : [Nested_Prompts]?

    enum CodingKeys: String, CodingKey {

        case prompt_values = "prompt_values"
        case nested_Prompts = "nested_Prompts"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        prompt_values = try values.decodeIfPresent(String.self, forKey: .prompt_values)
        nested_Prompts = try values.decodeIfPresent([Nested_Prompts].self, forKey: .nested_Prompts)
    }

}



struct Price_range : Codable {
    let min_price_range : [Int]?
    let max_price_range : [Int]?

    enum CodingKeys: String, CodingKey {

        case min_price_range = "min_price_range"
        case max_price_range = "max_price_range"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        min_price_range = try values.decodeIfPresent([Int].self, forKey: .min_price_range)
        max_price_range = try values.decodeIfPresent([Int].self, forKey: .max_price_range)
    }

}
struct Nested_Prompts : Codable {
    let nested_prompt_values : String?

    enum CodingKeys: String, CodingKey {

        case nested_prompt_values = "nested_prompt_values"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        nested_prompt_values = try values.decodeIfPresent(String.self, forKey: .nested_prompt_values)
    }

}
