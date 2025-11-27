# Deepwoken Rewrite
**Module diff vs. previous snapshot: +0/-3/~7 (added/removed/changed)**
```diff
- (removed) SilentheartHeavyRelentless
- (removed) SilentheartLightRelentless
- (removed) SilentheartMediumRelentless
+ (changed) CrescentCrit
+ (changed) SilentheartMediumMayhem
+ (changed) KatanaCritical
+ (changed) Scythe
+ (changed) SilentheartLightMayhem
+ (changed) EtherBarrage
+ (changed) Eruption
```

**Timing diff vs. previous snapshot: +2/-4/~1 (animation: +0/-3/~1, part: +0/-1/~0, effect: +2/-0/~0)**
```diff
+ (changed) Animation : Heartwing (by Blastbrean)
- (removed) Animation : SilentheartMediumRelentless (by Blastbrean)
- (removed) Animation : SilentheartHeavyRelentless (by Blastbrean)
- (removed) Animation : SlientheartLightRelentless (by Blastbrean)
- (removed) Part : MalStrike1 (by Blastbrean)
+ (added) Effect : ManiWindup (by Blastbrean)
+ (added) Effect : SilentheartWarn (by Blastbrean)
```
*Silentheart should be fully fixed in this update. All variants, all types, flow state or not.*
*The only thing I am concerned about is the Mani Katti. If it misses the initial parry, it will eat the entire combo.*

**New features?**
```diff
- (bug fix) Micro-profiling is now disabled when silent mode is on
+ (added) Delayed feinting
```

*Your commit ID should be "897de9" when the update is pushed to you.*