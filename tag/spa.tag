<spa>
    <div class="pure-g ask" if="{wait}">
        <div class="pure-u-1-2" each="{idx in model.getChoice() }">
            <div class="choice" onclick="{
                        parent.onRoll
                    }">{idx}</div>
        </div>
    </div>
    <div class="pure-g pool" if="{! wait}">
        <div class="pure-u-1-2" each="{item in model.pool}">
            <div class="die" onclick="{
                        parent.onReroll
                    }">{item}</div>
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

        this.onReroll = function () {
            self.wait = true
        }
    </script>
</spa>