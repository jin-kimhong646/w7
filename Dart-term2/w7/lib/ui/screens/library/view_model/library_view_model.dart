import 'package:flutter/material.dart';
import '../../../../data/repositories/songs/song_repository.dart';
import '../../../states/player_state.dart';
import '../../../states/settings_state.dart';
import '../../../../model/songs/song.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository songRepository;
  final PlayerState playerState;
  final AppSettingsState appSettingsState;

  LibraryViewModel({
    required this.songRepository,
    required this.playerState,
    required this.appSettingsState,
  });

  List<Song> get songs => songRepository.fetchSongs();

  Song? get currentSong => playerState.currentSong;

  Color get backgroundColor => appSettingsState.theme.backgroundColor;

  void playSong(Song song) {
    playerState.start(song);
    notifyListeners();
  }

  void stopSong() {
    playerState.stop();
    notifyListeners();
  }

}
