import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:robo_controller/data/posts/remote/post_api.dart';
import 'package:robo_controller/data/posts/remote/post_remote_data_source.dart';
import 'package:robo_controller/domain/posts/models/post_data_contract.dart';

import 'post_remote_data_source_impl_test.mocks.dart';

@GenerateNiceMocks(<MockSpec<Object>>[
  MockSpec<PostApi>(),
])
void main() {
  group(PostRemoteDataSourceImpl, () {
    late MockPostApi mockPostApi;

    setUp(() {
      mockPostApi = MockPostApi();
    });

    PostRemoteDataSourceImpl createUnitToTest() {
      return PostRemoteDataSourceImpl(mockPostApi);
    }

    group('getPosts', () {
      test('should return posts from api when called', () async {
        const List<PostDataContract> expectedContracts = <PostDataContract>[
          PostDataContract(userId: 1, id: 1, title: '', body: ''),
        ];
        final PostRemoteDataSourceImpl unit = createUnitToTest();
        when(mockPostApi.getPosts()).thenAnswer((_) async => expectedContracts);

        final Iterable<PostDataContract> actualContracts = await unit.getPosts();

        verify(mockPostApi.getPosts()).called(1);
        expect(actualContracts, equals(expectedContracts));
      });
    });
  });
}
