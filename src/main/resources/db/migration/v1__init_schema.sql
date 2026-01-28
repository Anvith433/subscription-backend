CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    passwordhash VARCHAR(255) NOT NULL UNIQUE,
    status VARCHAR(50) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    last_login_at TIMESTAMP WITH TIME ZONE
);

CREATE INDEX idx_users_email ON users(email);



CREATE TABLE recommendations (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    subscription_id BIGINT NOT NULL,
    type VARCHAR(50) NOT NULL,
    reason VARCHAR(100),
    confidence_score NUMERIC(5,2),
    status VARCHAR(50) NOT NULL,
    generated_at TIMESTAMP WITH TIME ZONE NOT NULL,

    CONSTRAINT fk_recommendation_user
        FOREIGN KEY (user_id) REFERENCES users(id),

    CONSTRAINT fk_recommendation_subscription
        FOREIGN KEY (subscription_id) REFERENCES subscriptions(id)
);


CREATE TABLE billing_records (
    id BIGSERIAL PRIMARY KEY,
    subscription_id BIGINT NOT NULL,
    amount NUMERIC(10,2),
    currency VARCHAR(3) NOT NULL,
    billing_period VARCHAR(7) NOT NULL,
    paid_at TIMESTAMP WITH TIME ZONE NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    source VARCHAR(50) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,

    CONSTRAINT fk_billing_subscription
        FOREIGN KEY (subscription_id) REFERENCES subscriptions(id)
);




CREATE TABLE user_snapshots (
    id BIGSERIAL PRIMARY KEY,
    subscription_id BIGINT NOT NULL,
    period VARCHAR(7) NOT NULL,
    usage_count INTEGER NOT NULL,
    last_used_at TIMESTAMP WITH TIME ZONE,
    source VARCHAR(50) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,

    CONSTRAINT uk_subscription_period
        UNIQUE (subscription_id, period),

    CONSTRAINT fk_snapshot_subscription
        FOREIGN KEY (subscription_id) REFERENCES subscriptions(id)
);
