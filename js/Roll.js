/* 
 * Roll for L5R
 */

var Roll = function () {
    riot.observable(this);
    this.rolled = 0
    this.kept = 0
    this.isEmphased = false
    this.isRerollingTens = false
    this.isRerollingNines = false
    this.pool = []
}

Roll.prototype.rollOneD10 = function () {
    return Math.floor(Math.random() * 10) + 1
}

Roll.prototype.getChoice = function () {
    var t = []
    for (var k = 1; k <= 10; k++) {
        t.push(k)
    }

    return t
}

Roll.prototype.rollingPool = function () {
    this.pool = []
    for (var k = 0; k < this.rolled; k++) {
        this.pool.push([this.rollOneD10()])
    }
    // sort
    this.sortPool()
}

Roll.prototype.getDice = function (n) {
    var d10 = this.pool[n]

    return d10.reduce(function (v, s) {
        return v + s
    })
}

Roll.prototype.getTotal = function () {
    var sum = 0
    for (var k = 0; k < this.kept; k++) {
        sum += this.getDice(k)
    }

    return sum
}

Roll.prototype.sortPool = function () {
    this.pool.sort(function (a, b) {
        var sa = a.reduce(function (v, s) {
            return v + s
        })
        var sb = b.reduce(function (v, s) {
            return v + s
        })

        return sb - sa
    })
}

Roll.prototype.reroll = function () {
    for (var k in this.pool) {
        // managing emphases : reroll Ones only once, not One after a Ten nor a One after another One
        if ((this.isEmphased) && (this.pool[k].length === 1) && (this.pool[k][0] === 1)) {
            this.pool[k] = [this.rollOneD10()] // replacing
        }
        // managing Nines and Tens :
        var exploding = []
        if (this.isRerollingNines) {
            exploding.push(9)
        }
        if (this.isRerollingTens) {
            exploding.push(10)
        }
        while (-1 !== exploding.indexOf(this.pool[k][0])) {
            this.pool[k].unshift(this.rollOneD10())
        }
    }
    this.sortPool()
    this.trigger('update')
}
