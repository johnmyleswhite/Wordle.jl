"""
Utility to allow indexing into arrays using the letters 'a' to 'z'.
"""
to_index(c::Char) = (c - 'a') + 1
