import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibiapabaapp/features/events/domain/entities/event.dart';
import 'package:ibiapabaapp/shared/ui/fragments/carousel/horizontal_infinite_carousel.dart';
import 'package:ibiapabaapp/shared/ui/fragments/events/event_card.dart';
import 'package:ibiapabaapp/shared/ui/layout/section_header.dart';

class NowHappeningSection extends StatelessWidget {
  const NowHappeningSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Event> eventList = [
      Event(
        id: '1',
        slug: 'slug',
        name: '2º Trilhão Tianguá Offroad',
        type: EventType.simple,
        coverImgUrl:
            'https://instagram.fjdo10-1.fna.fbcdn.net/v/t51.82787-15/619274405_17932095936169278_9113178893503771846_n.jpg?stp=dst-jpg_e35_p640x640_sh0.08_tt6&_nc_cat=102&ig_cache_key=MzgxNTcwMjMyMDU4NDI1NDIwOQ%3D%3D.3-ccb7-5&ccb=7-5&_nc_sid=58cdad&efg=eyJ2ZW5jb2RlX3RhZyI6InhwaWRzLjEzNDd4MTY3OS5zZHIuQzIifQ%3D%3D&_nc_ohc=qHsC5m7HWYkQ7kNvwFLEavh&_nc_oc=AdngYP9u-_iX5peSj24gRJcnJ7XS_1FtLh_c25F5Djd_O1BF4tirvANbCwR-zEMi6Hc&_nc_ad=z-m&_nc_cid=0&_nc_zt=23&_nc_ht=instagram.fjdo10-1.fna&_nc_gid=dneRjnA7SbqM6Ua1hxXKLA&_nc_ss=8&oh=00_AfwlFf2di0LW6ttxz5zpUgg28-_OnlMUHERbEM1cxgMntw&oe=69B644C6',
        reachLevel: .local,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      Event(
        id: '1',
        slug: 'slug',
        name: 'Evento 2',
        type: EventType.simple,
        coverImgUrl: '',
        reachLevel: .local,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ];

    return Column(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SectionHeader(
            title: 'Acontecendo agora',
            onSeeAllTap: () => context.push('/app/events'),
          ),
        ),

        HorizontalInfiniteCarousel(
          isLoading: false,
          items: eventList,
          itemWidth: 350,
          listHeight: 150,
          separator: SizedBox(width: 12),
          itemBuilder: (_, event) => EventCard(event: event),
        ),
      ],
    );
  }
}
