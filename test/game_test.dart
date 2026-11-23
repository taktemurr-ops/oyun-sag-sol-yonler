import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_sag_sol_yonler/oyun_sag_sol_yonler.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(yonlerConfig.title.length, 33);
    expect(yonlerConfig.tagline.length, 33);
    for (final s in yonlerConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(yonlerConfig.gameId, yonlerId);
    expect(yonlerRules.gameId, yonlerId);
    expect(yonlerConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(yonlerRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: yonlerId, optionalMechanics: yonlerRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(yonlerRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
