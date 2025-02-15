using Microsoft.VisualBasic;
using System;
using System.Collections.Generic;
using System.Numerics;
using System.Text;
using System.Linq;

public class Controller
{
    private Dictionary<string, User> users;

    public Controller()
    {
        users = new Dictionary<string, User>();
    }

    public string AddUser(List<string> args)
    {
        string username=args[0];
        int age=int.Parse(args[1]);

        string output = "";

        if (!users.ContainsKey(username))
        {
            users.Add(username, new User(username, age));
            output = $"Created User {username}!";
        }
        else 
        {
            output = "User already exists!";
        }

        return output;
    }

    public string AddPlaylist(List<string> args)
    {
        string username = args[0];
        string playlistTitle=args[1];

        var user=users.FirstOrDefault(x => x.Key == username);
        user.Value.AddPlaylist(new Playlist(playlistTitle));

        return $"Created Playlist {playlistTitle} for User {username}!"; ;
    }

    public string AddSongToPlaylist(List<string> args)
    {
        string username= args[0];
        string playlistTitle= args[1];
        string songTitle=args[2];
        int duration=int.Parse(args[3]);
        string artist=args[4];
        string genre=args[5];
        string type=args[6];
        string output = "";

        Playlist playlist=users
            .First(a => a.Key == username)
            .Value
            .GetPlaylistByTitle(playlistTitle);

        Song song;

        if (type == "Single")
        {
            DateTime releaseDate = DateTime.Parse(args[7]);
            song = new Single(songTitle, duration, artist, genre, releaseDate);
            playlist.AddSong(song);
        }
        else if (type == "AlbumSong")
        {
            string albumName=args[7];
            song = new AlbumSong(songTitle, duration, artist, genre, albumName);
            playlist.AddSong(song);
        }

        output = $"Added song {songTitle} to Playlist {playlistTitle}!";

        return output;
    }

    public string GetTotalDurationOfPlaylist(List<string> args)
    {
        string username=args[0];
        string playlistTitle=args[1];

        Playlist playlist = users
           .First(a => a.Key == username)
           .Value
           .GetPlaylistByTitle(playlistTitle);

        string output = "";
        if (playlist == null) { output = "Playlist not found!"; }
        output = $"Total duration of {playlistTitle}: {playlist.TotalDuration()} seconds";
        return output;
    }

    public string GetSongsByArtistFromPlaylist(List<string> args)
    {
        string username = args[0];
        string playlistTitle=args[1];
        string artist = args[2];

        Playlist playlist = users
          .First(a => a.Key == username)
          .Value
          .GetPlaylistByTitle(playlistTitle);

        var songs=playlist.GetSongsByArtist(artist);

        StringBuilder sb = new StringBuilder();

        foreach (Song song in songs) 
        {
            sb.AppendLine(song.ToString());
        }

        return sb.ToString();
    }

    public string GetSongsByGenreFromPlaylist(List<string> args)
    {
        string username = args[0];
        string playlistTitle = args[1];
        string genre = args[2];

        Playlist playlist = users
          .First(a => a.Key == username)
          .Value
          .GetPlaylistByTitle(playlistTitle);

        var songs = playlist.GetSongsByGenre(genre);

        StringBuilder sb = new StringBuilder();

        foreach (Song song in songs)
        {
            sb.AppendLine(song.ToString());
        }

        return sb.ToString();
    }

    public string GetSongsAboveDurationFromPlaylist(List<string> args)
    {
        string username = args[0];
        string playlistTitle = args[1];
        int duration = int.Parse(args[2]);

        Playlist playlist = users
          .First(a => a.Key == username)
          .Value
          .GetPlaylistByTitle(playlistTitle);

        var songs = playlist.GetSongsAboveDuration(duration);

        StringBuilder sb = new StringBuilder();

        foreach (Song song in songs)
        {
            sb.AppendLine(song.ToString());
        }

        return sb.ToString();
    }
}
/*
AddUser Ivan 20
AddPlaylist Ivan WorkoutHits
AddSongToPlaylist Ivan WorkoutHits BeatIt 240 MichaelJackson Pop Single 10/07/1983
AddSongToPlaylist Ivan WorkoutHits BillieJean 250 MichaelJackson Pop AlbumSong Thriller
GetTotalDurationOfPlaylist Ivan WorkoutHits
GetSongsByArtistFromPlaylist Ivan WorkoutHits MichaelJackson
End
*/