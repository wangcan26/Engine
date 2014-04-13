#ifndef SDL_MANAGER_H
#define SDL_MANAGER_H

#include <string>

#ifdef _WIN32
  #include <SDL.h>
#else
  #include <SDL2/SDL.h>
#endif

class SDLManager
{
public:
  SDLManager(void);
  ~SDLManager(void);

  void clean(void);

  int init(const int width, const int height, Uint32 flags);
  void tick(void);
  int poll_event(SDL_Event *event);
  Uint32 getDeltaTime(void);

private:
  void logSDLError(const std::string &msg);

  SDL_Window *win;
  SDL_GLContext glContext;

  Uint32 current_time, old_time;
};

#endif