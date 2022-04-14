package pl.coderslab.songs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/user/songs/")
public class SongController {

    @Autowired
    SongRepository songRepository;

    @GetMapping("/list")
    public String songList(Model model) {
        model.addAttribute("songs",songRepository.findAll());
        return "/songs/main";
    }

    @GetMapping("/add")
    public String songAddForm(Model model) {
        model.addAttribute("song",new Song());
        model.addAttribute("guitarTypes",guitarTypes());
        return "/songs/add";
    }

    @PostMapping("/add")
    public String songAdd(@Valid Song song, BindingResult result, Model model) {
        if(result.hasErrors()) {
            model.addAttribute("guitarTypes",guitarTypes());
            return "/songs/add";
        }
        song.setActive("1");
        songRepository.save(song);
        return "redirect:/user/songs/list";
    }

    @GetMapping("/delete/{id}")
    public String songDelete(@PathVariable Long id){
        songRepository.delete(songRepository.getById(id));
        return "redirect:/user/songs/list";
    }

    @GetMapping("/archive/{id}")
    public String songArchive(@PathVariable Long id){
        Song songToArchive = songRepository.getById(id);
        songToArchive.setActive("0");
        songRepository.save(songToArchive);
        return "redirect:/user/songs/list";
    }

    @GetMapping("/active/{id}")
    public String songActive(@PathVariable Long id){
        Song songToActivate = songRepository.getById(id);
        songToActivate.setActive("1");
        songRepository.save(songToActivate);
        return "redirect:/user/songs/list";
    }

    public List<String> guitarTypes() {
        return Arrays.asList("Acoustic","Bass","Classic","Electric");
    }
}