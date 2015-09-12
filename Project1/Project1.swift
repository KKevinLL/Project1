func nextCellStates(currentStates: [[Bool]]) -> [[Bool]] {
    // IMPLEMENT ME
    // Take a look at https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life for the rules
    var States = currentStates
    for i in 0...currentStates.count - 1 {
        for j in 0...currentStates[i].count - 1 {
            var live = 0
            for k in (i-1)...(i+1) {
                for l in (j-1)...(j+1) {
                    if k >= 0 && l >= 0 && k < currentStates.count && l < currentStates[i].count {
                        if currentStates[k][l] == true && (!(k == i && l == j)) {
                            live += 1
                        }
                    }
                }
            }
            if States[i][j] == true {
                if live < 2 {
                    States[i][j] = false
                }
                else if live == 2 || live == 3 {
                    States[i][j] = true
                }
                else if live > 3 {
                    States[i][j] = false
                }
            }
            else {
                if live == 3 {
                    States[i][j] = true
                }
            }
        }
    }
    
    return States
}

class LRUCache<K:Hashable, V> {
    private var capacity: Int
    private var data = Dictionary<K, V>()
    private var order:[K]
    init(capacity: Int) {
        self.capacity = capacity
        data = Dictionary<K, V>()
        order = []
    }
    
    func get(k: K) -> V? {
        // IMPLEMENT ME
        
        /*
        *  Get the value of the key if the key exists in the cache, otherwise return nil.
        */
        return self.data[k]
    }
    
    func set(k: K, v: V) {
        // IMPLEMENT ME
        
        /*
        * Set or insert the value if the key is not already present.
        * When the cache reached its capacity, it should invalidate the
        * least recently used item before inserting a new item.
        */
        if self.order.count < self.capacity {
            self.order.append(k)
            self.data[k] = v
        }
        else {
            let temp = self.order[0]
            self.data.removeValueForKey(temp)
            self.order.dropFirst()
            self.order.append(k)
            self.data[k] = v
        }
    }
}
