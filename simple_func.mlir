func.func @add_one(%a: f64) -> f64 {
    // this function adds 1 to the input
    %cf1 = arith.constant 1.00000e+00 : f64
    %co = arith.addf %a, %cf1 : f64
    return %co : f64
}
