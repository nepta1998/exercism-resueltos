// Package raindrops
package raindrops

import (
	"strconv"
)

func Convert(number int) string {
	result := ""
	ok := false
	if number%3 == 0 {
		result += "Pling"
		ok = true
	}
	if number%5 == 0 {
		result += "Plang"
		ok = true
	}
	if number%7 == 0 {
		result += "Plong"
		ok = true
	}

	if ok {
		return result
	}
	return strconv.Itoa(number)
	// panic("Please implement the Convert function")
}
