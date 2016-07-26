# This file is a part of ROOTFramework.jl, licensed under the MIT License (MIT).

using Cxx

import Base: string, show


TString() = @cxx TString()
TString(str::AbstractString) = @cxx TString(pointer(str))

string(tstr::TString) = unsafe_string((@cxx tstr->Data()), (@cxx tstr->Length()))
show(io::IO, x::TString) = print(io, "TString(\"$(escape_string(string(x)))\")")
