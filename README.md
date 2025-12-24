# 🍅 Pomodoro CLI Timer (Now with 100% More Cat!)

## ⚠️ IMPORTANT DISCLAIMER ⚠️
**This app contains ZERO AI. None. Nada. Zilch.**  
No machine learning, no neural networks, no blockchain, no cloud syncing to Mars.  
Just good old-fashioned Bash scripting and a cat playing with a ball. 🐱⚽

The cat is NOT sentient. It will NOT judge your productivity. It's just ASCII art on a loop.

---

## 🤔 What is this thing?

Ever tried to be productive but ended up doom-scrolling for 3 hours? Yeah, us too.

This is a **no-nonsense, terminal-based Pomodoro timer** that helps you actually get stuff done. It's like having a tiny productivity coach who's also a cat. The cat doesn't talk (thank goodness) but it DOES play with a ball while you work, which is oddly motivating.

### Why use this instead of fancy apps?
- ✅ No accounts to create
- ✅ No subscriptions to pay
- ✅ No "premium features" locked behind a paywall
- ✅ Works completely offline (because internet = distractions)
- ✅ Runs in your terminal like a true hacker
- ✅ Did we mention the ASCII cat? THE. CAT. 🐱

---

## 🎯 Features

- **First-time setup**: Tell it when you start/finish work (it remembers, unlike your goldfish)
- **Task planning**: List all your tasks before you start (no more "what was I doing again?")
- **Customizable Pomodoros**: Want 25-minute sessions? 45-minute deep work? Your call, boss.
- **Animated Cat Timer**: Watch a cat play with a ball while time ticks away (mesmerizing)
- **Desktop Notifications**: Pop-ups that actually tell you when to take a break
- **Progress Tracking**: See what task comes next (spoiler: it's work)
- **Color-coded Terminal UI**: Because we're not animals (except for the cat)

---

## 📦 Installation (Arch Linux)

### Step 1: Install Dependencies

You need `libnotify` for those sweet desktop notifications:

```bash
sudo pacman -S libnotify
```

That's it. We told you there's no AI. No TensorFlow, no PyTorch, just notifications.

### Step 2: Download the Script

```bash
# Create a scripts folder (or use wherever you keep your stuff)
mkdir -p ~/scripts
cd ~/scripts

# Download or create the file
nano pomodoro-timer.sh
```

Paste the script code, then save and exit (`Ctrl+X`, then `Y`, then `Enter`).

### Step 3: Make it Executable

```bash
chmod +x ~/scripts/pomodoro-timer.sh
```

### Step 4: Create an Alias (Optional but Cool)

Add this to your `~/.bashrc` or `~/.zshrc`:

```bash
echo "alias pomo='~/scripts/pomodoro-timer.sh'" >> ~/.bashrc
source ~/.bashrc
```

Now you can just type `pomo` and boom, productivity mode activated. 🚀

---

## 🚀 How to Use

### First Run (One-Time Setup)

```bash
pomo
```

The app will ask:
1. **"What time do you start work?"** (e.g., 09:00)
2. **"What time do you finish work?"** (e.g., 17:00)

This gets saved forever (or until you delete `~/.config/pomodoro-timer/config`).

### Daily Usage

Every time you run `pomo`, you'll:

#### 1️⃣ Enter Your Tasks
```
Task 0: Write README
  How many pomodoros for this task? 2
  Duration of each pomodoro (minutes)? 25

Task 1: Debug code
  How many pomodoros for this task? 3
  Duration of each pomodoro (minutes)? 30

Task 2: done
```

Type `done` when you're finished adding tasks (because we're not mind readers).

#### 2️⃣ Watch the Magic Happen

The app will:
- Show you the current task
- Display an animated cat playing with a ball (yes, really)
- Count down the time in big, bold numbers
- Show what task is coming up next (mental prep!)

```
╔═══════════════════════════════════════════════════════════╗
║              POMODORO PRODUCTIVITY TIMER                  ║
╚═══════════════════════════════════════════════════════════╝

Current Task: Write README

  /\_/\  
 ( o.o ) 
  > ^ <  
   ●   

Time Remaining: 24:37

Next Task: Debug code
```

#### 3️⃣ Get Notified

When each Pomodoro ends, you'll get:
- A desktop notification (pop-up on your screen)
- A prompt asking if you want to continue

```
✓ Pomodoro 1 of 2 completed!

Start next pomodoro? (y/n):
```

Press `y` to keep going, or `n` if you need an emergency snack break.

#### 4️⃣ Celebrate! 🎉

When all tasks are done, the app congratulates you because you deserve it.

---

## 🎨 What You'll See

### Colors Everywhere!
- 🔵 **Blue**: Questions and info
- 🟢 **Green**: Success and progress
- 🟡 **Yellow**: Cat animation (important!)
- 🟣 **Magenta**: Current task
- 🔴 **Red**: Errors (hopefully you won't see these)

### The Cat Animation

The cat has 4 frames of animation:
1. Cat looking at ball to the right
2. Ball moves right
3. Cat has happy eyes (living its best life)
4. Ball moves back

It's not sophisticated, but it's *ours*. 🐱❤️

---

## 📁 Files and Folders

The app creates:
- `~/.config/pomodoro-timer/config` - Your work hours
- `~/.config/pomodoro-timer/tasks.dat` - (Reserved for future use)

Want to reset everything? Just delete that folder:
```bash
rm -rf ~/.config/pomodoro-timer/
```

---

## 🐛 Troubleshooting

### "notify-send: command not found"
Install `libnotify`:
```bash
sudo pacman -S libnotify
```

### The cat looks weird!
Your terminal might not support the characters properly. Try a different terminal emulator (we recommend `alacritty` or `kitty`).

### The script won't run!
Make sure it's executable:
```bash
chmod +x ~/scripts/pomodoro-timer.sh
```

### I want to change my work hours!
Delete the config file:
```bash
rm ~/.config/pomodoro-timer/config
```
Then run the app again.

### The cat is judging me!
No it's not. It's ASCII. Get back to work. 😼

---

## 🤓 For the Nerds

**Tech Stack:**
- Bash (the OG scripting language)
- ANSI escape codes (for colors!)
- `notify-send` (for desktop notifications)
- Pure terminal magic ✨

**Lines of Code:** ~250  
**Lines of AI Code:** 0  
**Lines of Cat Animation:** 4 (the most important ones)

---

## 📜 License

Do whatever you want with this. MIT, GPL, WTFPL - pick your favorite acronym.  
Just don't blame us if you become *too* productive.

---

## 🙏 Credits

- **Pomodoro Technique**: Francesco Cirillo (the legend)
- **Cat Animation**: Some beautiful soul on the internet who loves ASCII art
- **You**: For actually reading this README instead of just running random scripts

---

## 💡 Pro Tips

1. **Be honest with yourself** - Don't set 50 pomodoros for "check email"
2. **Take actual breaks** - The app tells you when. Listen to it.
3. **Silence your phone** - Seriously. Do it. Now.
4. **Watch the cat** - It's weirdly therapeutic
5. **Start small** - 2-3 tasks per day is better than 20 unfinished ones

---

## 🎭 Final Words

Remember: This app has no AI, no tracking, no analytics. It doesn't know your name, your habits, or your deepest fears. It just knows that you have work to do and there's a cat playing with a ball.

Now stop reading and go be productive! 🚀

**Made with ☕, 😴, and a questionable amount of caffeine.**

---

*P.S. - If you name the cat, you've been working too long. Take a break.* 🐱


*Redme was Genereted By AI* 
