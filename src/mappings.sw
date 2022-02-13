use std::chain::*;
use std::hash::*;
use std::storage::*;

pub trait SingleHashMap {
        fn store(self, key1:b256, value:u64);
        fn retrieve(self, key1:b256) -> u64;
}

pub struct Mapping{
        map_id : b256
}

impl SingleHashMap for Mapping {
    fn store<K, V>(self, key1:K, value:V) {
        let storage_slot = hash_pair(key1, self.map_id, HashMethod::Sha256);

        store(storage_slot, value);

    }

    fn retrieve<K, V>(self, key1: K) -> V {
        let storage_slot = hash_pair(key1, self.map_id, HashMethod::Sha256);

        let resultingValue = get::<V>(storage_slot);

        resultingValue
    }
}
