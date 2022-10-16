let Player = {
  player: null,

  init(domId, playerId, onReady) {
    window.onYouTubeIframeAPIReady = () => {
      this.onIframeReady(domId, playerId, onReady);
    };
    let youtybeScriptTag = document.createElement('script');
    youtybeScriptTag.src = '//www.youtube.com/iframe_api';
    document.head.appendChild(youtybeScriptTag);
  },

  onIframeReady(domId, playerId, onReady) {
    this.player = new YT.Player(domId, {
      height: '360',
      width: '420',
      videoId: playerId,
      events: {
        onReady: onReady,
        onStateChange: this.onPlayerStateChange,
      },
    });
  },
  onPlayerStateChange(event) {},
  getCurrentTime() {
    return Math.floor(this.player.getCurrentTime() * 1000);
  },
  seekTo(millSec) {
    return this.player.seekTo(millSec / 1000);
  },
};

export default Player;
