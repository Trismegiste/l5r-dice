<spa>
    <div class="pure-g roll" if="{state == 'roll'}">
        <div class="pure-u-1-2" each="{ idx in model.getChoice() }">
            <div class="choice" onclick="{
                        parent.onRoll
                    }">{idx}</div>
        </div>
    </div>
    <div class="pure-g keep" if="{state == 'keep'}">
        <div class="pure-u-1-3 { model.hasAtLeastOneDie(10) ? 'rollingTen' : 'nodice' }">
            <label>     
                <input type="checkbox" checked="{ model.isRerollingTens }" disabled="{ model.isRerollingTens }"  onclick="{
                            onRerollTens
                        }"/> 10's
            </label>
        </div>
        <div class="pure-u-1-3 { model.hasAtLeastOneDie(1) ? 'rollingOne' : 'nodice' }">
            <label>
                <input type="checkbox" checked="{ model.isEmphased }" disabled="{ model.isEmphased }"  onclick="{
                            onRerollOnes
                        }"/> 1's
            </label>
        </div>
        <div class="pure-u-1-3 { model.hasAtLeastOneDie(9) ? 'rollingNine' : 'nodice' }">
            <label>
                <input type="checkbox" checked="{ model.isRerollingNines }" disabled="{ model.isRerollingNines }"  onclick="{
                            onRerollNines
                        }"/> 9's
            </label>
        </div>
        <div class="pure-u-1-2" each="{d10, idx in model.pool}">
            <div class="die" onclick="{
                        parent.onKeep
                    }">{ model.getDice(idx) }</div>
        </div>
    </div>
    <div class="pure-g summary" if="{state == 'summary'}">
        <div class="pure-u-1-3 rollingTen" if="{ model.isRerollingTens }"><div class="flag">10's</div></div>
        <div class="pure-u-1-3 rollingOne" if="{ model.isEmphased }"><div class="flag">1's</div></div>
        <div class="pure-u-1-3 rollingNine" if="{ model.isRerollingNines }"><div class="flag">9's</div></div>
        <div class="pure-u-1 dicepool">{ model.rolled }g{ model.kept }</div>
        <div class="pure-u-1 total">{ model.getTotal() }</div>
        <button class="pure-button pure-u-1 pure-button-primary" onclick="{
                    onReset
                }">Reset</button>
    </div>
    <footer if="{state == 'roll'}">Select to roll...</footer>
    <footer if="{state == 'keep'}">Click to reroll and select to keep</footer>
    <footer if="{state == 'summary'}" class="pure-g">
        <div class="pure-u-1-5" each="{d10 in model.pool}">
            {d10}
        </div>
    </footer>
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
            model.rerollExplode()
        }

        this.onRerollOnes = function (e) {
            model.isEmphased = true
            model.rerollEmphase()
        }

        this.onRerollNines = function (e) {
            model.isRerollingTens = true
            model.isRerollingNines = true
            model.rerollExplode()
        }

        this.onReset = function () {
            model.isEmphased = false
            model.isRerollingTens = false
            model.isRerollingNines = false
            self.state = 'roll'
        }

        model.on('update', function () {
            self.update()
        })
    </script>
</spa>