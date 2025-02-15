using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

public class Playlist
{
    private string title;

    public string Title
    {
        get
        {
          return title;
        }
        set
        {
            if(value.Length<3 || value.Length > 50)
            {
                throw new ArgumentException("Playlist title should be between 3 and 50 characters!");
            }
            title = value;
        }
    }

    private List<Song> songs;

    public Playlist(string title)
    {
        Title= title;
        songs = new List<Song>();
    }

    public void AddSong(Song song)
    {
        songs.Add(song);
    }

    public int TotalDuration()
    {
        int sum = songs.Sum(s => s.Duration);
        return sum;
    }

    public List<Song> GetSongsByArtist(string artist)
    {
        List<Song> foundSongs=songs
            .Where(s=>s.Artist==artist)
            .OrderBy(s=>s.Title)
            .ToList();

        return foundSongs;
    }

    public List<Song> GetSongsByGenre(string genre)
    {
        List<Song> foundSongs = songs
            .Where(s => s.Genre == genre)
            .OrderBy(s => s.Title)
            .ToList();

        return foundSongs;
    }

    public List<Song> GetSongsAboveDuration(int duration)
    {
        List<Song> foundSongs = songs
            .Where(s=>s.Duration>=duration)
            .OrderByDescending(s=>s.Duration)
            .ToList();

        return foundSongs;
    }

    public override string ToString()
    {
        return $"Playlist: {Title}\n" +
            $"Total Songs: {songs.Count}";
    }
}
