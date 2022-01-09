library rebase;


pub struct Rebase {
    elastic:u64,
    base:u64,
}

fn toBase(total:Rebase, elastic:u64, roundUp:bool) -> u64 {
    let mut base:u64 = 0;

    if(total.elastic == 0){
        base = elastic;
    } else {
        base = (elastic * total.base) / total.elastic;
        if (roundUp && (base * total.elastic) / total.base < elastic) {
            base = base + 1;
        };
    }; 

    base
}


fn toElastic(total:Rebase, base:u64, roundUp:bool) -> u64 {
    let mut elastic:u64 = 0;

    if(total.elastic == 0){
        elastic = base;
    } else {
        elastic = (base * total.elastic) / total.base;
        
        if (roundUp && (elastic * total.base) / total.elastic < base) {
            elastic = elastic + 1;
        };
    };

    elastic
}