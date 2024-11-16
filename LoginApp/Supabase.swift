//
//  Supabase.swift
//  LoginApp
//
//  Created by marco on 16/11/24.
//

import Foundation
import Supabase

let supaKey = ProcessInfo.processInfo.environment["SUPABASE_KEY"] ?? ""
let supaURL = ProcessInfo.processInfo.environment["SUPABASE_URL"] ?? ""

let supabase = SupabaseClient(
    supabaseURL: URL(string: supaURL)!,
    supabaseKey: supaKey
)
