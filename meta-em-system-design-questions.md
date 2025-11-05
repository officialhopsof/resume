# Meta Engineering Manager System Design Questions

## Top 15 System Design Questions for Engineering Managers at Meta

This document covers the most common system design questions asked of engineering managers during Meta interviews, with comprehensive solutions that demonstrate both technical depth and leadership capabilities.

---

## 1. Design Facebook News Feed

### Problem Statement
Design a scalable news feed system that serves billions of users with personalized content, supporting real-time updates, diverse content types, and sophisticated ranking algorithms.

### Ideal Solution

**High-Level Architecture:**
- **Fan-out Service**: Pre-compute feeds for active users (write fan-out)
- **Feed Generation Service**: Real-time feed assembly for inactive users (read fan-out)
- **Ranking Service**: ML-based content ranking and personalization
- **Content Storage**: Distributed storage for posts, media, and metadata

**Key Components:**
1. **Write Path**
   - Post ingestion → Fan-out workers → Cache updates
   - Hybrid approach: fan-out for non-celebrity users, pull for celebrities
   - Async processing for non-critical updates

2. **Read Path**
   - Feed cache (Redis/Memcached) → Ranking service → Client
   - Edge caching for static content
   - Progressive loading for media-heavy feeds

**Technical Decisions:**
- **Storage**: Cassandra for posts (time-series data), MySQL for user relationships
- **Cache Strategy**: Multi-layer caching (CDN → Edge → Application → Database)
- **Ranking**: Real-time ML models with feature stores
- **Scale**: Horizontal sharding by user ID, geographic distribution

**EM Considerations:**
- **Team Structure**: Split into Feed Generation, Ranking, Storage, and Infrastructure teams
- **Cross-functional Coordination**: Work with ML, Product, and Data teams
- **Performance SLAs**: P95 latency < 500ms, 99.99% availability
- **Monitoring**: Real-time dashboards for feed quality metrics, engagement rates
- **Risk Management**: Gradual rollout with A/B testing, feature flags for quick rollback

**Trade-offs Discussed:**
- Fan-out vs. Pull model (chose hybrid for efficiency)
- Consistency vs. Availability (eventual consistency acceptable)
- Real-time vs. Batch processing (real-time for active users, batch for inactive)

---

## 2. Design Instagram Stories

### Problem Statement
Design a system to support ephemeral content that disappears after 24 hours, with high upload throughput, real-time viewing, and efficient storage management.

### Ideal Solution

**High-Level Architecture:**
- **Upload Service**: Handle video/image uploads with transcoding
- **Storage Service**: Temporary storage with automated expiration
- **View Service**: Real-time story delivery with viewer tracking
- **Cleanup Service**: Automated deletion after 24 hours

**Key Components:**
1. **Upload Pipeline**
   - Client → Upload service → S3/Blob storage → Transcoding queue
   - Multiple resolution generation for different devices
   - Thumbnail generation for fast previews

2. **Storage Strategy**
   - Hot storage (first 6 hours): SSD-based, edge cached
   - Warm storage (6-24 hours): Standard cloud storage
   - Metadata in NoSQL with TTL indexes

3. **View Path**
   - CDN → Video streaming service → Analytics tracking
   - Viewer list updates via WebSocket
   - Pre-fetching for likely next stories

**Technical Decisions:**
- **Storage**: S3 with lifecycle policies, CloudFront CDN
- **Streaming**: Adaptive bitrate streaming (HLS/DASH)
- **Viewer Tracking**: Real-time updates via WebSocket, batch analytics via Kafka
- **Cleanup**: Background workers with TTL-based deletion

**EM Considerations:**
- **Team Structure**: Upload team, Streaming team, Storage team
- **Resource Planning**: Cost optimization for temporary storage (significant savings opportunity)
- **Quality Metrics**: Upload success rate, playback start time, viewer engagement
- **Operational Excellence**: Automated monitoring for storage costs, cleanup verification
- **Product Collaboration**: Balance quality vs. upload speed, storage duration policies

**Trade-offs Discussed:**
- Storage duration (24 hours balances engagement vs. storage costs)
- Resolution quality vs. upload time (adaptive approach)
- Real-time viewer updates vs. battery drain (batched updates every 5s)

---

## 3. Design WhatsApp

### Problem Statement
Design an end-to-end encrypted messaging system supporting billions of users with extremely high reliability, low latency, and minimal infrastructure costs per user.

### Ideal Solution

**High-Level Architecture:**
- **Message Gateway**: WebSocket-based persistent connections
- **Message Queue**: Reliable message delivery with retry logic
- **Encryption Service**: End-to-end encryption key management
- **Presence Service**: Online/offline status tracking
- **Media Service**: Image/video/document sharing

**Key Components:**
1. **Messaging Core**
   - Persistent connections via WebSocket
   - Message queue per user (Kafka/RabbitMQ)
   - Delivery acknowledgments (sent, delivered, read)
   - Offline message storage

2. **Encryption**
   - Signal Protocol for E2E encryption
   - Key exchange and management
   - Forward secrecy implementation

3. **Group Messaging**
   - Efficient multi-cast to group members
   - Admin controls and member management
   - Group metadata synchronization

**Technical Decisions:**
- **Storage**: Messages stored encrypted, deleted after delivery confirmation
- **Scaling**: Connection servers by geography, message routing by user hash
- **Reliability**: Multi-datacenter replication, circuit breakers, graceful degradation
- **Efficiency**: Binary protocol (protobuf), aggressive message compression

**EM Considerations:**
- **Team Structure**: Core Messaging, Encryption, Media, Infrastructure, Client teams
- **Security First**: Privacy reviews for all features, regular security audits
- **Cost Optimization**: Minimize storage, efficient protocols (critical at WhatsApp scale)
- **Reliability Culture**: On-call rotations, post-mortem processes, chaos engineering
- **Cross-Platform**: Coordinate iOS, Android, Web, Desktop teams for consistent experience

**Trade-offs Discussed:**
- E2E encryption vs. features (chose privacy, limited cloud features)
- Message retention (delete after delivery to minimize storage)
- Rich features vs. simplicity (chose simplicity for reliability)

---

## 4. Design Facebook Live (Live Video Streaming)

### Problem Statement
Design a system to support live video broadcasting to millions of concurrent viewers with minimal latency, interactive features, and adaptive quality.

### Ideal Solution

**High-Level Architecture:**
- **Ingest Service**: Video ingestion from broadcasters
- **Transcoding Service**: Multi-resolution encoding
- **Distribution Network**: Global CDN with edge caching
- **Interaction Service**: Real-time comments and reactions
- **Analytics Service**: Viewer metrics and broadcaster insights

**Key Components:**
1. **Broadcast Pipeline**
   - RTMP ingestion → Transcoding cluster → Packaging (HLS/DASH)
   - Adaptive bitrate encoding (multiple resolutions)
   - Low-latency protocols (WebRTC for < 3s latency)

2. **Distribution**
   - Multi-tier CDN architecture
   - Edge servers for regional distribution
   - Viewer-based routing to nearest edge

3. **Interactive Features**
   - WebSocket for real-time comments
   - Reaction aggregation and animation
   - Viewer count tracking

**Technical Decisions:**
- **Latency Target**: 3-5 seconds for HLS, < 3s for WebRTC option
- **Scaling**: Auto-scaling transcoding based on broadcast volume
- **Quality**: Adaptive bitrate streaming based on viewer bandwidth
- **Cost**: Efficient CDN usage, edge computing for encoding

**EM Considerations:**
- **Team Structure**: Ingest team, Encoding team, Distribution team, Interactive team
- **Product Partnership**: Work with product on features (donations, Q&A, polls)
- **Infrastructure**: Capacity planning for peak events (Super Bowl, breaking news)
- **Quality Metrics**: Latency, buffering rate, engagement metrics
- **Incident Response**: 24/7 on-call for high-profile broadcasts

**Trade-offs Discussed:**
- Latency vs. quality (offer both standard and low-latency modes)
- Cost vs. quality (adaptive bitrate reduces bandwidth costs)
- Features vs. simplicity (incremental rollout of interactive features)

---

## 5. Design Facebook Messenger

### Problem Statement
Design a rich messaging platform supporting text, media, voice/video calls, group chats, and additional features like payments, games, and business messaging.

### Ideal Solution

**High-Level Architecture:**
- **Message Service**: Core messaging infrastructure
- **Media Service**: Photo, video, file sharing
- **Real-time Service**: Voice and video calling
- **Presence Service**: Online status and typing indicators
- **Business Platform**: Bot framework and business tools

**Key Components:**
1. **Messaging Core**
   - WebSocket persistent connections
   - Message queues with ordering guarantees
   - Delivery tracking (sent, delivered, seen)
   - Message search and history

2. **Media Handling**
   - Upload → Compression → CDN storage
   - Thumbnail generation
   - Progressive loading

3. **Real-time Communication**
   - WebRTC for P2P voice/video
   - TURN servers for NAT traversal
   - Group call mixing servers

4. **Platform Features**
   - Bot SDK and webhooks
   - Payment integration
   - Games platform

**Technical Decisions:**
- **Storage**: Cassandra for messages, S3 for media
- **Presence**: Redis with TTL for online status
- **Search**: Elasticsearch for message search
- **Voice/Video**: WebRTC with fallback to relay servers

**EM Considerations:**
- **Team Structure**: Core messaging, Media, Voice/Video, Platform, Business teams
- **Cross-functional**: Coordinate with WhatsApp team for shared infrastructure
- **Feature Prioritization**: Balance consumer vs. business features
- **Platform Ecosystem**: Manage external developer relationships
- **Quality Bar**: High reliability for core messaging, experimental for new features

**Trade-offs Discussed:**
- Feature richness vs. simplicity (chose features over WhatsApp's simplicity)
- Encryption vs. features (optional encryption to enable cloud features)
- Platform openness vs. control (managed ecosystem)

---

## 6. Design Facebook Notifications

### Problem Statement
Design a notification system that delivers billions of notifications daily across mobile, web, and email, with user preferences, rate limiting, and high delivery guarantees.

### Ideal Solution

**High-Level Architecture:**
- **Notification Service**: Central orchestration
- **Channel Services**: Push (mobile), Email, Web, SMS
- **Preference Service**: User notification settings
- **Rate Limiter**: Prevent notification spam
- **Analytics Service**: Delivery and engagement tracking

**Key Components:**
1. **Notification Pipeline**
   - Event source → Notification service → Preference filter → Rate limiter → Channel router
   - Priority queues (critical, important, normal)
   - Batch processing for non-urgent notifications

2. **Channel Delivery**
   - **Mobile Push**: APNs (iOS), FCM (Android)
   - **Email**: SendGrid/SES with template management
   - **Web**: WebSocket for real-time, polling fallback
   - **SMS**: Twilio integration for critical notifications

3. **Personalization**
   - User preference management
   - Notification grouping and summarization
   - Time zone aware delivery

**Technical Decisions:**
- **Queue System**: Kafka for high throughput, RabbitMQ for priority queues
- **Rate Limiting**: Token bucket per user per category
- **Storage**: PostgreSQL for preferences, Cassandra for notification history
- **Delivery Guarantee**: At-least-once delivery with idempotency

**EM Considerations:**
- **Team Structure**: Core platform team, Channel teams (Mobile, Email, Web)
- **Product Collaboration**: Balance engagement vs. user experience
- **Privacy**: Respect user preferences, GDPR compliance
- **Quality Metrics**: Delivery rate, time-to-deliver, engagement rate, opt-out rate
- **Cost Management**: Email and SMS costs, optimization strategies

**Trade-offs Discussed:**
- Immediate vs. batched delivery (batch for non-urgent to reduce noise)
- Rich vs. simple notifications (platform-dependent)
- Delivery guarantee vs. cost (at-least-once with deduplication)

---

## 7. Design Facebook Search

### Problem Statement
Design a search system that indexes billions of posts, users, pages, groups, and events, providing relevant results in real-time with personalization.

### Ideal Solution

**High-Level Architecture:**
- **Indexing Service**: Real-time index updates
- **Search Service**: Query processing and ranking
- **Ranking Service**: ML-based relevance scoring
- **Type-ahead Service**: Auto-complete suggestions
- **Privacy Service**: Results filtering based on permissions

**Key Components:**
1. **Indexing Pipeline**
   - CDC from primary databases → Index builder → Elasticsearch/Solr
   - Real-time indexing for new content
   - Incremental updates for edits
   - Privacy metadata indexing

2. **Search Processing**
   - Query parsing and expansion
   - Multi-index search (users, posts, pages, etc.)
   - Relevance scoring with ML models
   - Result aggregation and ranking

3. **Type-ahead**
   - Prefix search with fuzzy matching
   - Personalized suggestions
   - Trending queries

**Technical Decisions:**
- **Search Engine**: Elasticsearch for flexibility, custom ranking plugins
- **Indexing**: Separate indexes per content type, sharded by geography
- **Ranking**: Neural ranking models with online learning
- **Privacy**: Real-time permission checks, cached ACLs

**EM Considerations:**
- **Team Structure**: Indexing team, Query team, Ranking team, Infrastructure team
- **ML Partnership**: Collaborate with ML teams on ranking models
- **Privacy**: Rigorous privacy review for all features
- **Quality Metrics**: Search success rate, time-to-result, click-through rate
- **A/B Testing**: Continuous experimentation on ranking algorithms

**Trade-offs Discussed:**
- Real-time vs. eventual consistency (real-time for recent content, batch for historical)
- Relevance vs. privacy (filter results server-side for privacy)
- Feature richness vs. performance (progressive enhancement)

---

## 8. Design Facebook Events

### Problem Statement
Design a system for creating, discovering, and managing events, with invitations, RSVPs, reminders, and location-based recommendations.

### Ideal Solution

**High-Level Architecture:**
- **Event Service**: CRUD operations for events
- **Discovery Service**: Event recommendations and search
- **Invitation Service**: Guest management and notifications
- **Reminder Service**: Time-based notifications
- **Location Service**: Geo-based event discovery

**Key Components:**
1. **Core Event Management**
   - Event creation and editing
   - Guest list management
   - RSVP tracking (going, interested, not going)
   - Event updates and notifications

2. **Discovery**
   - Location-based search (geospatial indexing)
   - Interest-based recommendations
   - Friend activity integration
   - Trending events

3. **Notifications**
   - Invitation notifications
   - Event reminders (1 day, 1 hour before)
   - Update notifications
   - Post-event follow-up

**Technical Decisions:**
- **Storage**: PostgreSQL for event data with geospatial extensions
- **Search**: Elasticsearch with geo-queries
- **Recommendations**: Collaborative filtering + location scoring
- **Reminders**: Scheduled job service with time-zone handling

**EM Considerations:**
- **Team Structure**: Event platform team, Discovery team, Notifications team
- **Product Collaboration**: Balance public vs. private events, viral growth features
- **Quality Metrics**: Event creation rate, RSVP conversion, attendance rate
- **Spam Prevention**: Prevent event spam, quality scoring
- **Local Partnerships**: Work with local businesses for event promotion

**Trade-offs Discussed:**
- Public discoverability vs. privacy (user-controlled)
- Notification frequency vs. engagement (smart rate limiting)
- Feature scope vs. simplicity (MVP first, iterate)

---

## 9. Design Facebook Marketplace

### Problem Statement
Design a peer-to-peer marketplace for buying and selling items locally, with search, recommendations, messaging, and payment integration.

### Ideal Solution

**High-Level Architecture:**
- **Listing Service**: Item listings and inventory
- **Search & Discovery**: Location-based search and recommendations
- **Messaging Service**: Buyer-seller communication
- **Payment Service**: Secure payment processing
- **Trust & Safety**: Fraud detection and user verification

**Key Components:**
1. **Listing Management**
   - Item creation with photos and details
   - Category classification (ML-based)
   - Pricing recommendations
   - Listing lifecycle (active, sold, expired)

2. **Search & Discovery**
   - Geospatial search (within X miles)
   - Category and price filtering
   - Personalized recommendations
   - Saved searches with alerts

3. **Transaction Flow**
   - In-app messaging
   - Payment processing (optional)
   - Shipping integration
   - Rating and review system

4. **Trust & Safety**
   - Fraud detection (ML models)
   - User verification
   - Listing quality scoring
   - Dispute resolution

**Technical Decisions:**
- **Storage**: PostgreSQL for listings with PostGIS, S3 for images
- **Search**: Elasticsearch with geo-queries and filters
- **Messaging**: Integrate with Messenger infrastructure
- **Payment**: Stripe/Payment gateway integration
- **Safety**: ML models for scam detection, image recognition for prohibited items

**EM Considerations:**
- **Team Structure**: Listing team, Discovery team, Trust & Safety team, Payments team
- **Cross-functional**: Work with legal, policy, and operations teams
- **Regulatory**: Compliance with local commerce regulations
- **Quality Metrics**: Listing quality, transaction success rate, user trust score
- **Operational**: Content moderation processes, customer support escalation

**Trade-offs Discussed:**
- Open marketplace vs. moderated (balance with ML and human review)
- In-app payments vs. external (gradual rollout)
- Local vs. shipping (started local, expanded to shipping)

---

## 10. Design Facebook Groups

### Problem Statement
Design a system for communities to form, share content, and interact, with varying privacy levels, member management, and content moderation at scale.

### Ideal Solution

**High-Level Architecture:**
- **Group Service**: Group creation and management
- **Content Service**: Posts, comments, and media within groups
- **Member Service**: Membership and permission management
- **Moderation Service**: Content and member moderation tools
- **Discovery Service**: Group recommendations and search

**Key Components:**
1. **Group Management**
   - Group creation with privacy settings (public, closed, secret)
   - Admin and moderator roles
   - Group rules and guidelines
   - Member approvals and invitations

2. **Content Management**
   - Posts feed (similar to News Feed but scoped to group)
   - Rich content types (text, photos, videos, polls, files)
   - Pinned posts and announcements
   - Content scheduling

3. **Moderation Tools**
   - Auto-moderation (keyword filters, spam detection)
   - Admin dashboard for member management
   - Content approval queues
   - Reporting and appeals

4. **Discovery**
   - Group recommendations based on interests
   - Search with filters
   - Trending groups
   - Similar group suggestions

**Technical Decisions:**
- **Storage**: Separate sharding strategy by group size (small, medium, large)
- **Feed**: Chronological for small groups, ranked for large groups
- **Permissions**: Role-based access control (RBAC)
- **Moderation**: ML models + human review queues

**EM Considerations:**
- **Team Structure**: Core Groups team, Moderation team, Discovery team, Integrity team
- **Community Ops**: Work with community operations and policy teams
- **Safety**: Prevent harmful groups, terrorist content, misinformation
- **Quality Metrics**: Group health score, engagement rate, admin satisfaction
- **Scaling Challenges**: Large groups (>1M members) require special handling

**Trade-offs Discussed:**
- Open vs. moderated (provide tools, let admins decide)
- Chronological vs. ranked feed (depends on group size)
- Discovery vs. privacy (respect group privacy settings)

---

## 11. Design Facebook Watch (Video Platform)

### Problem Statement
Design a video platform competing with YouTube, supporting long-form content, creator tools, monetization, and personalized recommendations.

### Ideal Solution

**High-Level Architecture:**
- **Upload Service**: Video ingestion and processing
- **Storage Service**: Multi-tier video storage
- **Streaming Service**: Adaptive video delivery
- **Recommendation Service**: Personalized video feed
- **Creator Platform**: Analytics, monetization, and tools

**Key Components:**
1. **Video Pipeline**
   - Upload → Transcoding (multiple resolutions) → CDN distribution
   - Thumbnail generation
   - Subtitle generation (speech-to-text)
   - Content classification (ML-based)

2. **Streaming**
   - Adaptive bitrate streaming (HLS/DASH)
   - CDN with edge caching
   - Offline download support
   - Playback quality optimization

3. **Recommendations**
   - Neural recommendation models
   - Watch history and preferences
   - Social signals (friend activity)
   - Personalized homepage and up-next

4. **Creator Tools**
   - Upload and editing tools
   - Analytics dashboard
   - Monetization (ads, subscriptions)
   - Audience management

**Technical Decisions:**
- **Storage**: S3 with intelligent tiering (hot/warm/cold)
- **Transcoding**: Distributed encoding cluster with priority queues
- **Recommendations**: Deep learning models (two-tower architecture)
- **Monetization**: Ad insertion service, revenue analytics

**EM Considerations:**
- **Team Structure**: Upload team, Streaming team, Recommendations team, Creator team, Monetization team
- **Product Differentiation**: Focus on social discovery vs. search-based discovery
- **Creator Relations**: Build creator programs, partnerships, and support
- **Quality Metrics**: Watch time, engagement rate, creator satisfaction, revenue per view
- **Content Safety**: Proactive detection of policy-violating content

**Trade-offs Discussed:**
- YouTube-like vs. social-first (chose social-first approach)
- Upload quality vs. processing time (balance with parallel processing)
- Recommendation diversity vs. engagement (balance to prevent filter bubbles)

---

## 12. Design Facebook Ads System

### Problem Statement
Design an advertising system that serves billions of ad impressions daily, with precise targeting, real-time bidding, and comprehensive analytics for advertisers.

### Ideal Solution

**High-Level Architecture:**
- **Ad Service**: Ad creation and management
- **Targeting Service**: Audience definition and matching
- **Auction Service**: Real-time bidding and ad selection
- **Delivery Service**: Ad serving and impression tracking
- **Analytics Service**: Performance metrics and reporting

**Key Components:**
1. **Ad Creation**
   - Campaign management (objective, budget, schedule)
   - Creative management (images, videos, copy)
   - Targeting criteria (demographics, interests, behaviors)
   - Bidding strategy (CPC, CPM, CPA)

2. **Ad Selection**
   - User profile → Eligible ads → Auction → Ranking → Delivery
   - ML-based relevance scoring
   - Bid optimization algorithms
   - Frequency capping

3. **Real-time Bidding**
   - Second-price auction mechanism
   - Total value = Bid × Estimated action rate × Quality score
   - Sub-100ms decision time
   - Budget pacing

4. **Analytics**
   - Real-time metrics (impressions, clicks, conversions)
   - Attribution modeling
   - A/B testing framework
   - Recommendation engine for advertisers

**Technical Decisions:**
- **Storage**: Ad metadata in MySQL, user targeting data in graph database
- **Auction**: In-memory computation with pre-computed scores
- **Delivery**: CDN for ad creatives, low-latency ad server
- **Privacy**: Aggregated targeting, differential privacy

**EM Considerations:**
- **Team Structure**: Targeting team, Auction team, Delivery team, Measurement team, Advertiser tools team
- **Revenue Impact**: Directly impacts company revenue, high stakes
- **Privacy**: Navigate privacy regulations (GDPR, CCPA) while maintaining targeting effectiveness
- **Quality Metrics**: Revenue, advertiser ROI, user experience (ad relevance)
- **A/B Testing**: Rigorous experimentation culture, careful revenue impact analysis

**Trade-offs Discussed:**
- Targeting precision vs. privacy (aggregated targeting with k-anonymity)
- Ad load vs. user experience (balance revenue with UX)
- Auction complexity vs. latency (optimize for speed)

---

## 13. Design Instagram Explore

### Problem Statement
Design a personalized content discovery system that surfaces relevant posts, reels, and accounts to users based on their interests and behaviors.

### Ideal Solution

**High-Level Architecture:**
- **Candidate Generation**: Identify potential content to recommend
- **Ranking Service**: Score and rank candidates
- **Personalization Service**: User interest modeling
- **Diversity Service**: Ensure content variety
- **Analytics Service**: Track engagement and feedback

**Key Components:**
1. **Candidate Generation**
   - Content from accounts user doesn't follow
   - Trending content in user's region
   - Content similar to user's liked posts
   - Hashtag and location-based content
   - Multi-source candidate pool (~1000s per user)

2. **Ranking Pipeline**
   - Neural ranking models (likelihood of engagement)
   - Predicted interaction types (like, comment, share, save)
   - Quality scoring (content quality, author reputation)
   - Personalization features (user history, preferences)
   - Final ranking combines multiple signals

3. **Diversity & Quality**
   - Content type diversity (photos, reels, carousel)
   - Creator diversity (avoid same creator repeatedly)
   - Topic diversity (varied interests)
   - Quality filters (remove spam, low-quality content)

4. **Real-time Feedback**
   - Click → Update user model → Influence next fetch
   - Negative feedback (hide, not interested)
   - Implicit signals (dwell time, saves)

**Technical Decisions:**
- **Candidate Generation**: Multiple retrieval strategies (collaborative filtering, content-based, graph-based)
- **Ranking**: Two-tower neural network for fast inference
- **Storage**: User embeddings in vector database, content features in feature store
- **Real-time**: Online learning to update models quickly

**EM Considerations:**
- **Team Structure**: Candidate generation team, Ranking team, ML infrastructure team
- **ML Partnership**: Heavy collaboration with ML research teams
- **Product Balance**: Discovery vs. Following feed engagement
- **Quality Metrics**: Time spent, engagement rate, content creator diversity
- **A/B Testing**: Sophisticated experimentation infrastructure

**Trade-offs Discussed:**
- Engagement vs. diversity (balance with diversity constraints)
- Personalization vs. serendipity (introduce randomness)
- Real-time vs. batch (hybrid approach)

---

## 14. Design Facebook/Instagram Analytics Dashboard

### Problem Statement
Design an analytics system for creators and businesses to track performance metrics, audience insights, and content analytics in real-time.

### Ideal Solution

**High-Level Architecture:**
- **Data Collection**: Event tracking and aggregation
- **Processing Pipeline**: Real-time and batch analytics
- **Storage Service**: Time-series and aggregate data
- **Query Service**: Fast analytics queries
- **Visualization Service**: Dashboard and reporting

**Key Components:**
1. **Data Collection**
   - Event streaming (impressions, clicks, engagements)
   - Client-side tracking (view duration, scroll depth)
   - Server-side logging (all interactions)
   - Mobile and web SDK for tracking

2. **Processing Pipeline**
   - **Real-time**: Stream processing (Flink/Spark Streaming)
     - Live metrics (current viewers, engagement rate)
     - Alerting for unusual patterns
   - **Batch**: Daily/weekly aggregations
     - Historical trends
     - Complex derived metrics
     - Cohort analysis

3. **Storage**
   - Time-series database (InfluxDB/TimescaleDB) for metrics
   - Columnar storage (Parquet on S3) for historical data
   - Aggregate tables for fast queries
   - Pre-computed rollups at multiple granularities (hour, day, week, month)

4. **Query & Visualization**
   - Query service with caching
   - Custom date ranges and filters
   - Comparative analysis (time periods, content types)
   - Export capabilities

**Technical Decisions:**
- **Streaming**: Kafka → Flink for real-time processing
- **Storage**: TimescaleDB for time-series, Presto for historical queries
- **Caching**: Redis for frequently accessed metrics
- **Scalability**: Pre-aggregation for common queries, sampling for large datasets

**EM Considerations:**
- **Team Structure**: Data collection team, Processing team, Query team, Frontend team
- **Data Engineering**: Strong data engineering expertise required
- **Performance**: Sub-second query response for dashboards
- **Quality Metrics**: Query latency, data freshness, accuracy
- **Cost**: Balance granularity with storage costs

**Trade-offs Discussed:**
- Real-time vs. accuracy (eventual consistency for near real-time)
- Granularity vs. cost (store raw events with TTL, keep aggregates longer)
- Pre-compute vs. query-time (pre-compute common metrics)

---

## 15. Design Multi-Region Facebook Infrastructure

### Problem Statement
Design a global infrastructure strategy to serve billions of users across multiple regions with high availability, low latency, and disaster recovery capabilities.

### Ideal Solution

**High-Level Architecture:**
- **Regional Data Centers**: Multiple regions across continents
- **Edge Network**: CDN and edge compute globally
- **Global Routing**: Intelligent traffic routing
- **Data Replication**: Cross-region replication strategy
- **Disaster Recovery**: Failover and backup systems

**Key Components:**
1. **Regional Architecture**
   - Each region is semi-autonomous (can operate independently)
   - Full stack deployment per region (app servers, databases, cache)
   - Regional user affinity (users primarily served by nearest region)
   - Cross-region communication for global consistency

2. **Data Distribution**
   - **User Data**: Primary region based on user location
   - **Content**: Replicated globally with eventual consistency
   - **Social Graph**: Replicated across regions with optimization
   - **Hot Data**: Cached at edge locations

3. **Traffic Management**
   - DNS-based routing to nearest region
   - Anycast for edge services
   - Dynamic routing based on load and health
   - Failover to backup regions

4. **Disaster Recovery**
   - Active-active configuration for critical services
   - Regular failover drills
   - Data backup across regions
   - Automated recovery procedures

**Technical Decisions:**
- **Regions**: 5-10 major regions (US West, US East, EU, Asia, etc.)
- **Consistency**: Eventual consistency for most data, strong consistency for critical data
- **Replication**: Async replication with conflict resolution
- **Routing**: Geo-DNS + Anycast + Application-level routing

**EM Considerations:**
- **Team Structure**: Regional SRE teams, Global infrastructure team, Networking team, DR team
- **Cross-Team Coordination**: Manage handoffs between regional teams
- **Operational Excellence**: 
  - 24/7 on-call rotation across time zones
  - Disaster recovery runbooks
  - Chaos engineering to test resilience
- **Cost vs. Redundancy**: Balance redundancy level with costs
- **Compliance**: Data residency requirements (GDPR, etc.)
- **Quality Metrics**: Regional latency, availability per region, failover time

**Trade-offs Discussed:**
- Strong consistency vs. latency (eventual consistency for most data)
- Full redundancy vs. cost (active-active for critical, active-passive for others)
- Regional isolation vs. global features (balance with data replication)

**Disaster Scenarios:**
- Region failure → Traffic rerouted to other regions within minutes
- Network partition → Regions operate independently, reconcile later
- Data corruption → Restore from backups, multiple backup copies

---

## Engineering Manager Interview Tips

### Key Evaluation Areas

1. **Technical Depth**
   - Demonstrate understanding of fundamental concepts
   - Make clear trade-off decisions with rationale
   - Show awareness of edge cases and failure scenarios

2. **System Thinking**
   - Consider the entire system, not just individual components
   - Think about scalability, reliability, and maintainability
   - Discuss monitoring, alerting, and observability

3. **Leadership & Team Building**
   - Describe team structure and size for each component
   - Discuss how you'd scale the team as the system grows
   - Mention cross-functional collaboration needs

4. **Product Sense**
   - Understand user needs and product requirements
   - Make engineering decisions that support product goals
   - Balance feature velocity with technical excellence

5. **Operational Excellence**
   - Discuss SLAs, monitoring, and alerting
   - Describe incident response procedures
   - Mention A/B testing and experimentation infrastructure

6. **Communication**
   - Use diagrams to illustrate architecture
   - Explain technical concepts clearly
   - Listen to interviewer feedback and adjust

### Interview Structure Approach

1. **Requirements Clarification (5-10 min)**
   - Ask about scale (users, requests, data)
   - Clarify functional requirements
   - Understand non-functional requirements (latency, availability)

2. **High-Level Design (10-15 min)**
   - Draw architecture diagram
   - Identify major components
   - Describe data flow
   - Discuss team structure

3. **Deep Dive (15-20 min)**
   - Focus on 1-2 components in detail
   - Discuss technology choices
   - Cover failure scenarios
   - Explain monitoring and operations

4. **Trade-offs & Scale (5-10 min)**
   - Discuss design trade-offs
   - Explain scaling strategy
   - Cover cost considerations
   - Address edge cases

### Red Flags to Avoid

- Jumping to implementation without clarifying requirements
- Ignoring failure scenarios and edge cases
- Not considering team structure and organization
- Missing cross-functional dependencies
- Ignoring cost implications
- Not discussing monitoring and operations
- Over-engineering or under-engineering for the scale
- Poor communication or ignoring interviewer cues

### Success Signals

- Clear, structured thinking
- Appropriate level of detail (high-level first, then deep dive)
- Strong trade-off analysis with rationale
- Consideration of team and organizational aspects
- Awareness of Meta-specific technologies and practices
- Good communication and collaboration with interviewer
- Flexibility to adjust based on feedback

---

## Additional Resources

- **Meta Engineering Blog**: Read about actual system architectures
- **Papers**: MapReduce, Cassandra, TAO, Memcache at Facebook
- **Books**: 
  - "Designing Data-Intensive Applications" by Martin Kleppmann
  - "System Design Interview" by Alex Xu
- **Practice**: Draw diagrams, explain out loud, get feedback

