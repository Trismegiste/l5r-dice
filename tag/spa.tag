<spa>
    <form class="pure-form pure-g">
        <button class="pure-button pure-u-1-3">10's</button>
        <button class="pure-button pure-u-1-3">9's</button>
        <button class="pure-button pure-u-1-3">1's</button>
    </form>
    <div class="pure-g ask" if="{wait}">
        <div class="pure-u-1-2" each="{idx in model.getChoice() }">
            <div class="choice" onclick="{
                        parent.onRoll
                    }">{idx}</div>
        </div>
    </div>
    <div class="pure-g pool" if="{! wait}">
        <div class="pure-u-1-2" each="{d10 in model.pool}">
            <div class="die" onclick="{
                        parent.onReroll
                    }">{d10[0]}</div>
        </div>
    </div>
    <script>
        var self = this
        this.wait = true

        this.onRoll = function (e) {
            var number = e.item.idx
            model.rollingPool(number)
            self.wait = false
        }

        this.onReroll = function (e) {
            var lastValue = e.item.d10[0]
            self.wait = true
        }
    </script>
</spa>