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
    fn store(self, key: b256, value:u64) {
        let storage_slot = hash_pair(self.name, key, HashMethod::Sha256);
        
        store(storage_slot, value);

    }

    fn retrieve(self, key: b256) -> u64 {
        let storage_slot = hash_pair(self.name, key, HashMethod::Sha256);

        let resultingValue:u64 = get::<u64>(storage_slot);

        resultingValue
    }
}
