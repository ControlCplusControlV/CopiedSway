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

pub struct RebaseReturn {
    totalRebase:Rebase,
    baseValue:u64,
}

fn addWRound(total: Rebase, elastic:u64, roundUp:bool) -> RebaseReturn {
    let base = toBase(total, elastic, roundUp);
    total.elastic = total.elastic + elastic;
    total.base = total.base + base;
    let returnValue: RebaseReturn = RebaseReturn{
        totalRebase:total,
        baseValue:base,
    };

    returnValue
}


fn subWRound(total: Rebase, elastic:u64, roundUp:bool) -> RebaseReturn {
    let base = toBase(total, elastic, roundUp);
    total.elastic = total.elastic - elastic;
    total.base = total.base - base;
    let returnValue: RebaseReturn = RebaseReturn{
        totalRebase:total,
        baseValue:base,
    };

    returnValue
}
 
fn add(total:Rebase, elastic:u64, base:u64) -> Rebase {
    total.elastic = total.elastic + elastic;
    total.base = total.base + base;

    total
}

fn sub(total:Rebase, elastic:u64, base:u64) -> Rebase {
    total.elastic = total.elastic - elastic;
    total.base = total.base - base;

    total
}

/* ---------------- Important to note that these methods are different than Boring Solidity ----------- */
// Storage is iffy so this just returns a new rebase every time, Functional Programming remains supreme

fn addElastic(total:Rebase, elastic:u64) -> Rebase {
    total.elastic = total.elastic + elastic;

    total
}

fn subElastic(total:Rebase, elastic:u64) -> Rebase {
    total.elastic = total.elastic - elastic;

    total
}
