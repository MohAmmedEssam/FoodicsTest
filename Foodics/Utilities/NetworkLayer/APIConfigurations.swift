//
//  APIConfigurations.swift
//  Foodics
//
//  Created by Mohammed Essam on 9/22/20.
//  Copyright © 2020 Elhayes. All rights reserved.
//
import Foundation

//-----------------------------------------------------------------------
//  MARK: - Enum
//-----------------------------------------------------------------------
enum RequestType {
    case json
    case formData
    case formEncoded
}

enum RequestMethod:String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

//-----------------------------------------------------------------------
//  MARK: - Structs
//-----------------------------------------------------------------------
/*
 *-------------------
 * >> APIConfig
 *-------------------
 * baseURL: API base URL
 * timeout: request timeout
 * token: API OAuth token
 * headers: adding more header fields
 *
 * >>>> Testing attrs needs to be false to load REST API data
 */
struct ApiConfig {
    var baseURL: String = ApiConstants.baseUrl
    var token: String = ApiConstants.token
    var headers: Dictionary<String, String> = [:]
}

/*
 *-------------------
 * >> UploadFile
 *-------------------
 * data: binary
 * name: filename
 * type: extension (png, jpeg, etc)
 */
struct UploadFile {
    var data: Data
    var name: String
    var type: String
}

/*
*-------------------
* >> ApiConstants
*-------------------
*/
struct ApiConstants {

    //eng.mohammedessam@gmail.com
    //ZW56q.LyUjU6*9Q
    static let baseUrl = "https://api.foodics.dev/v5"
    static let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjdmZjI1OGFhZDNhNzg0NTg3YjYxMWIyOTE5ZTY2MzQ0MTQ3ZDJiYzhjNWRiNjg5MTcwZDQ2YmI0MDk3OWQ2NzcyMGVmODJjODFlMDhlNmY4In0.eyJhdWQiOiI4Zjc4NjY2NC0wNTg5LTQ3MTgtODBkMS1lMTY4M2FmYmM3MjQiLCJqdGkiOiI3ZmYyNThhYWQzYTc4NDU4N2I2MTFiMjkxOWU2NjM0NDE0N2QyYmM4YzVkYjY4OTE3MGQ0NmJiNDA5NzlkNjc3MjBlZjgyYzgxZTA4ZTZmOCIsImlhdCI6MTYwMDc4MDYyMSwibmJmIjoxNjAwNzgwNjIxLCJleHAiOjE2MzIzMTY2MjEsInN1YiI6IjhmN2I2NmYwLWE1MjctNGNkNC05MjNkLTYyODM3MDQ1Yjk5NSIsInNjb3BlcyI6WyJnZW5lcmFsLnJlYWQiXSwiYnVzaW5lc3MiOiI4ZjdiNjZmMC1hNTUxLTRlNmYtODU5Mi0wMmRhZjBjNTUzODYiLCJyZWZlcmVuY2UiOiIxMDAwMDAifQ.blSePjjGXdZ-D1Nx14H7rSRHZFRE88kbvtYzJX7jkYk3IgTi3lWYoTZMwYbkupIQf4oZCZfWoOVbdIS1j0KzvvDPlSTIuEQ7f28bZbSHMRSU_F2AtEpxKFmtr4mHGL_p6lmsx8siX9bEW5Klf44R6WkcCmRTOb_HdgeWwO1BhZJsEPB9F5h-j3qkpfz2MRQzGcpu6UF08G43QJ2Of7-6oIIgi2dWJumymOeP_hfWRnDmlZgFYZr4kNJwDUTT2jefXGqa3FTvRzDVuJodIEnLCDckxHLP69zybMzruXt1PA2qIkplaVPGrx-sMlg7jU6p_HDEpPtELDlpRTbyKiTsFOPqQADiphnjjqe3u3PfCC-mve-E-Kvflpw3wwF4c-nbhU56yl--HDJJmMjkSnRFXaawGqy6owYV1ECcCZvuVp6EWgHOd307B_cXzkA0nWw93fVWiMCEjb51dvp1NZXJSZKDgwerFzBZGrAj3bOYoMsCSc6a8EJg2OJPLiR6-6d_sJmNmGsN4FqEbuRNp-cDHo5GvQ-L_n1bYvlRP1XO4_PqWxsu3W6z8gXwhpR4y3-0e94SoYNTrrpBrIsdnPoR8JOPNXAPF2sHiqLWKGiJGDkxKihwy8pq97HLFyUtrArsb7xbwfIwK2ZtL6PYQBa2vg9g7k-kW12qVTyiyRwATFY"

}

