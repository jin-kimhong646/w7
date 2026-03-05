import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w7/model/songs/song.dart';
import 'package:w7/ui/screens/favorite/favorite_screen.dart';
import 'package:w7/ui/screens/library/view_model/library_view_model.dart';

class LibraryContent extends StatelessWidget {
  const LibraryContent({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<LibraryViewModel>() ; 
    
    return Container(
      color: vm.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16,),
          const Text("Library") ,
          Expanded(
            child: ListView.builder(
              itemCount: vm.songs.length,
              itemBuilder: (context, index) {
                final song = vm.songs[index];

                return SongTile(
                  song: song,
                  isPlaying: vm.currentSong == song,
                  onTap: () => vm.playSong(song),
                  onRightTap: () => vm.stopSong(),
                );
              },
            ),
          ),
        ],
      ),
    );
    
  }
}

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
     required this.song,
     required this.onTap,
     required this.onRightTap,
     required this.isPlaying,
    });
     final Song song;
  final VoidCallback onTap;
  final VoidCallback onRightTap;
  final bool isPlaying;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(song.title),
      onTap: onTap,
      trailing: isPlaying
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Playing", style: TextStyle(color: Colors.amber)),
                IconButton(
                  onPressed: onRightTap,
                  icon: Icon(Icons.stop),
                  color: Colors.red,
                ),
              ],
            )
          : null,
    );
  }
}