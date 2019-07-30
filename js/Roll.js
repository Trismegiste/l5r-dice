/* 
 * Roll for L5R
 */

var Roll = function () {
    riot.observable(this);
    this.rolled = 0
    this.kept = 0
    this.isEmphazed = false
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
}