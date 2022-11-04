package com.spopia.infra.modules.NaverLogin;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

public class NaverLoginBO {

    // client_id: 애플리케이션 등록 후 발급받은 클라이언트 아이디
    // response_type: 인증 과정에 대한 구분값. code로 값이 고정돼 있습니다.
    // redirect_uri: 네이버 로그인 인증의 결과를 전달받을 콜백 URL(URL 인코딩). 애플리케이션을 등록할 때 Callback
    // URL에 설정한 정보입니다.
    // state: 애플리케이션이 생성한 상태 토큰
    public final static String CLIENT_ID = ""; // 네이버 CLIENT_ID
    public final static String CLIENT_SECRET = ""; // 네이버 CLIENT_SECRET
    public final static String REDIRECT_URI = ""; // 네이버 Callback URI
    public final static String SESSION_STATE = "oauth_state";

    // 프로필 조회 API URL
    private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";

    /*
     * public String getAuthorizationUrl(HttpSession session) {
     * //세션 유효성 검증을 위하여 난수를 생성
     * String state = generateRandomString();
     * //생성한 난수 값을 session에 저장
     * session.setAttribute("session", state);
     * //Scribe에서 제공하는 인증 URL 생성 기능을 이용하여 네아로 인증 URL 생성
     * OAuth20Service oauthService = new
     * ServiceBuilder(state).apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET).callback(
     * REDIRECT_URI).build(NaverLoginApi.instance());
     * 
     * return oauthService.getAuthorizationUrl();
     * }
     * 
     * public OAuth2AccessToken getAccessToken(HttpSession session, String code,
     * String state) throws IOException {
     * 
     * String sessionState = getSession(session);
     * 
     * if (StringUtils.pathEquals(sessionState, state)) {
     * OAuth20Service oauthService = new
     * ServiceBuilder(sessionState).apiKey(CLIENT_ID).callback(REDIRECT_URI).build(
     * NaverLoginApi.instance());
     * OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
     * return accessToken;
     * }
     * return null;
     * }
     * 
     * 난수 생성기
     * private String generateRandomString() {
     * return UUID.randomUUID().toString();
     * }
     * 
     * private void setSession(HttpSession session, String state) {
     * session.setAttribute(SESSION_STATE, state);
     * }
     * 
     * private String getSession(HttpSession session) {
     * return (String) session.getAttribute(SESSION_STATE);
     * }
     * 
     * public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException
     * {
     * OAuth20Service oauthService = new
     * ServiceBuilder(CLIENT_ID).apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET).callback
     * (REDIRECT_URI).build(NaverLoginApi.instance());
     * 
     * OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL);
     * oauthService.signRequest(oauthToken, request);
     * Response response = request.send();
     * return response.getBody();
     * }
     */

}
