<spa>
    <div class="pure-g roll" if="{state == 'roll'}">
        <div class="pure-u-1-2" each="{ idx in model.getChoice() }">
            <div class="choice" onclick="{
                        parent.onRoll
                    }">{idx}</div>
        </div>
    </div>
    <div class="pure-g keep" if="{state == 'keep'}">
        <div class="pure-u-1-3">
            <input type="checkbox" checked="{ model.isRerollingTens }" disabled="{ model.isRerollingTens }"  onclick="{
                        onRerollTens
                    }"/>10's
        </div>
        <div class="pure-u-1-3">
            <input type="checkbox" checked="{ model.isEmphased }" disabled="{ model.isEmphased }"  onclick="{
                        onRerollOnes
                    }"/>1's
        </div>
        <div class="pure-u-1-3">
            <input type="checkbox" checked="{ model.isRerollingNines }" disabled="{ model.isRerollingNines }"  onclick="{
                        onRerollNines
                    }"/>9's
        </div>
        <div class="pure-u-1-2" each="{d10, idx in model.pool}">
            <div class="die" onclick="{
                        parent.onKeep
                    }">{ model.getDice(idx) }</div>
        </div>
    </div>
    <div class="pure-g summary" if="{state == 'summary'}">
        <div class="pure-u-1">{ model.rolled }g{ model.kept }</div>
        <div class="pure-u-1">{ model.getTotal() }</div>
        Yolo - rerool - historic
    </div>
    <script>
        this.state = 'roll'  // 'keep' & 'summary'
        var self = this

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

        this.onRerollTens = function (e) {
            model.isRerollingTens = true
            model.reroll()
        }

        this.onRerollOnes = function (e) {
            model.isEmphased = true
            model.reroll()
        }

        this.onRerollNines = function (e) {
            model.isRerollingTens = true
            model.isRerollingNines = true
            model.reroll()
        }

        model.on('update', function () {
            self.update()
        })
    </script>
</spa>