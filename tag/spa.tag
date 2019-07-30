<spa>
    <div class="pure-g ask" if="{state == 'roll'}">
        <div class="pure-u-1-2" each="{idx in model.getChoice() }">
            <div class="choice" onclick="{
                        parent.onRoll
                    }">{idx}</div>
        </div>
    </div>
    <div class="pure-g pool" if="{state == 'keep'}">
        <button class="pure-button pure-u-1-3">10's</button>
        <button class="pure-button pure-u-1-3">1's</button>
        <button class="pure-button pure-u-1-3">9's</button>
        <div class="pure-u-1-2" each="{d10 in model.pool}">
            <div class="die" onclick="{
                        parent.onKeep
                    }">{d10[0]}</div>
        </div>
    </div>
    <div class="pure-g pool" if="{state == 'summary'}">
        Yolo - rerool - historic
    </div>
    <script>
        var self = this
        this.state = 'roll'  // 'keep' & 'summary'

        this.onRoll = function (e) {
            rollSound.play()
            model.rolled = e.item.idx
            model.rollingPool()
            self.state = 'keep'
        }

        this.onKeep = function (e) {
            var lastValue = e.item.d10[0]
            self.state = 'summary'
        }
    </script>
</spa>