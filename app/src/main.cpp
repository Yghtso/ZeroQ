#include <test.h>

#include <format>
#include <print>

int main() {
  int result = somma(1, 2);
  std::println("{}", result);
  return 0;
}