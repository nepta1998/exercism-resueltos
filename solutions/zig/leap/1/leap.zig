pub fn isLeapYear(year: u32) bool {
    const result = year % 4;
    if (result == 0){
        if (year%100==0 and year%400!=0)
            return false;
        return true;
    }
    return false;
}
