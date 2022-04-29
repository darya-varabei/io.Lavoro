//
//  Array+Intersection.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 29.04.22.
//

import Foundation

extension Array
    where Element: Equatable
{
    func intersects(_ other: Array) -> Bool
    {
        for e in other {
            if contains(where: {$0 == e}) {
                return true
            }
        }
        return false
    }
}
