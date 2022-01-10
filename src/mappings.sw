library mappings;

use std::chain::*;
use std::hash::*;
use std::storage::*;

pub struct Mapping {
    name:b256
}

pub trait IsMapping {
    fn store(self, key: b256, value: u64);
    fn retrieve(self, key: b256) -> u64;

}

impl IsMapping for Mapping {
    fn store<T>(self, key: b256, value:T) {
        let storage_slot = hash_pair(self.name, key, HashMethod::Sha256);
        
        store(storage_slot, value);

    }

    fn retrieve<T>(self, key: b256) -> T {
        let storage_slot = hash_pair(self.name, key, HashMethod::Sha256);

        let resultingValue:T = get::<T>(storage_slot);

        resultingValue
    }
}
