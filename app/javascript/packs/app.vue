<template>
  <div id="app">
    <div class="tile" v-for="tile in tiles" :style="tileStyles(tile)" @click="goTo(tile)">
      x
    </div>

    <div class="player" :style="playerStyle"></div>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      tiles: [],
      player: {}
    }
  },

  mounted () {
    this.fetchPlayer()
    this.fetchMap()
  },

  methods: {
    tileStyles (tile) {
      return `top: ${tile.y * 80}px; left: ${tile.x * 80}px`
    },

    fetchMap () {
      let req = this.$http.get('/api/current_user/fov')

      req.then((resp) => {
        this.tiles = resp.data
      })
    },

    fetchPlayer () {
      let req = this.$http.get('/api/current_user')

      req.then((resp) => {
        this.player = resp.data
      })
    },

    goTo (tile) {
      let req = this.$http.post('/api/current_user/go_to', { x: tile.x, y: tile.y })
    }
  },

  computed: {
    playerStyle () {
      return `top: ${this.player.y * 80}px; left: ${this.player.x * 80}px`
    }
  }
}
</script>

<style>
.tile {
  width: 80px;
  height: 80px;
  background: red;
  display: inline-block;
  position: absolute;
}

.player {
  width: 80px;
  height: 80px;
  position: absolute;
  display: inline-block;
  background: green;
  border-radius: 50%;
}
</style>
