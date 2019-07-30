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
        <div class="pure-u-1-2" each="{d10, idx in model.pool}">
            <div class="die" onclick="{
                        parent.onKeep
                    }">{ model.getDice(idx) }</div>
        </div>
    </div>
    <div class="pure-g pool" if="{state == 'summary'}">
        <div class="pure-u-1">{ model.rolled }g{ model.kept }</div>
        <div class="pure-u-1">{ model.getTotal() }</div>
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
            model.kept = e.item.idx + 1
            self.state = 'summary'
        }
    </script>
</spa>