const std = @import("std");
pub fn isIsogram(str: []const u8) bool {
    var letter_map = [_]u8{0} ** 256;
    
    for (str) |chr|{
        const l_chr = std.ascii.toLower(chr);
        if (letter_map[l_chr]>0){
            return false;
        }
        if (l_chr != ' ' and l_chr != '-'){
            letter_map[l_chr] += 1;
        }
        
    }
    return true;
    
}
